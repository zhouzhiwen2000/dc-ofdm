# Demodulator optimization

Primeramente, vemos que el diseño no cumple el timing por mucho. Aplicamos correcciones en los lugares donde el "adaptative pipelining" agregó delays.

![Alt text](images/first_run.png)

Luego de tocar un poco, el problema de timing depende del bloque que obtiene el ángulo de un número complejo.

![Alt text](images/angle_timing.png)

Por suerte, cuando se genera el código HDL, este bloque es reemplazado por varios bloques visibles.

Por lo que se genera el código HDL, y se reemplaza el bloque "complex to magnitude-angle" por su representación "expandida", y se agregan los delays necesarios para reducir su timing.

Al desactivar todas las optimizaciones el bloque se comportó normal. Vemos que el timing no cumple para el multiplicador de muchos bits, por lo que hay que bajar la resolución un poco.

![Alt text](images/timing_without_clock_pipelining.png)

Actualmente la resolución de ese multiplicador es fixdt(1, 32, 24).

Para optimizar los multiplicadores complejos, matlab genera a mano la multiplicación y suma para obtener el equivalente.

![Alt text](images/complex_multiply.png)

Para evitar que se rompa, el bloque que calcula el "frequency offset" se lo configura para que no pueda ser optimizado.

![Alt text](images/freq_offset_properties.png)

Al correr nuevamente la generación de HDL, el bloque este es un HDP:

![Alt text](images/aa.png)

Cuál es el problema? Cuando corrí sin optimizaciones, el problema de delay estaba en el multiplicador complejo. Pero cuando corro con optimizaciones y deshabilito la optimización para el bloque, ahora es ese bloque el que molesta el delay...

Procedo a cambiar los multiplicadores complejos por su versión "extendida". Este es el resultado SIN OPTIMIZACIONES:

![Alt text](images/bb.png)

El camino crítico no dependía de como estaba definido el complex multiplier, sino de la cantidad de bits.

Actualmente la resolución de ese multiplicador es fixdt(1, 32, 24). La bajo a fixdt(1, 24, 18):

![Alt text](images/cc.png)

En conclusión, la resolución máxima queda limitada por el timing. El problema es que al bajarle la resolución, deja de coincidir con la referencia dorada. Hay que hacer un análisis más profundo de cómo funcionan el transmisor y receptor en conjunto con el ADC y DAC.


## Sintesis

Utilización con:

```m
CONST.ADCDataType = fixdt(1, 14, 13);

CONST.FIFOOFDMSize = 1200;

CONST.rxNCOWordLength = 16;
CONST.rxNCOFractionLength = 14; 

CONST.rxDecimatorCoefficientsDataType = fixdt(1,16);
CONST.rxDecimatorOutputDataType = fixdt(1,16,14);

CONST.rxMDataType = fixdt(1,16,14);
CONST.rxRDataType = fixdt(1,32,24);
CONST.rxPDataType = fixdt(1,16,12);

CONST.rxOFDMDemodDataType = fixdt(1,16,14);

CONST.rxChannelEstReferenceWordLength = 16;
CONST.rxChannelEstReferenceFractionLength = 14;

CONST.rxQAMDemodDataType = fixdt(1,16,10);
```

![Alt text](images/dd.png)

Vamos a tratar de reducir la utilización de DSP, analizando bloque por bloque.

## Downshifter

Hay un delay importante en el multiplicador que calcula la frecuencia de offset.

![Alt text](images/ee.png)

Se cambia la lógica para reducir el tamaño del multiplicador, y también se saca un multiplicador del "ofdm_ss".

Luego de reducir el multilpicador, vemos que el slack de setup del camino crítico se redujo

![Alt text](images/ff.png)

La síntesis en Vivado da la siguiente utilización de recursos y timing:

![Alt text](images/gg.png)

![Alt text](images/hh.png)

## Decimator

No hay problemas con el timing, pero si veo que Matlab me informa que se usan muchos multiplicadores. Actualmente, el decimador tiene 49 coeficientes, y un delay de 24.

![Alt text](images/ii.png)

![Alt text](images/jj.png)

Matlab decía 25 multiplicadores, Vivado dice 25 DSP.

![Alt text](images/kk.png)

Luego de modificar un poco el decimator y hacerlo menos estricto, se logro reducir la cantidad de multiplicadores a 15:

![Alt text](images/ll.png)

Nota: reducir el tamaño de palabra de 16 bits a 12 bits no redujo la cantidad de multiplicadores usados por Vivado.

## OFDM Symbol Sync

La utilización de recursos da multiplicadores, pero son de 32 bits, ojo:

![Alt text](images/mm.png)

TODO: volver a este bloque por problemas de timing, ahora estoy con utilizacion.

## OFDM Demod

Con respecto al timing, esto se puede solucionar con multiple cycle paths:

![Alt text](images/nn.png)

Respecto a la utilización de recursos, 12 multiplicadores.

![Alt text](images/oo.png)

## OFDM Equalizer

El timing da bien, pero va a haber que usar multiple cycle path constraints.

![Alt text](images/pp.png)

La utilización de registros dio un poco alta, por lo que se cambiaron algunos delays por block rams. 20 multiplicadores.

![Alt text](images/qq.png)

## QAM DEMOD

Encontré el bloque que consumía muchos recursos:

![Alt text](images/rr.png)

Actualmente, está instanciada la demodulación para 16QAM, pero solamente se usa hasta 4QAM, así que saco los bloques para 2QAM y 16QAM, y simplifico un poco la lógica.

![Alt text](images/ss.png)

## Generación de Demodulador completo luego de los cambios de arriba

Como podemos ver, todavía estamos arriba de los 80 DSP que tiene la Red Pitaya. 

![Alt text](images/tt.png)

La utilización de recursos actual está en 92 multiplicadores, de los cuales:

* 12 del OFDM Demodulator.
* 3 para calcular R.
* 2 para calcular P.
* 4*2 de los multiplicadores complejos.
* 30 del decimador.
* 1 del downshifter.
* 2 del digital_carrier_receiver
* 1 del ofdm_separator.
* 1 del psdu_size_to_payload_len
* 12 del OFDM Channel Estimator.
* 8 del OFDM Equalizer
* 12 del 4QAM_demod

Además, recordar que hay 2*2 DSP usados por los LDPC decoders.

Vemos que el decimador, que debería consumir 15 multiplicadores, terminó consumiendo 30.

Luego de investigar, se descubrió que los datos de entrada y salida eran del tipo complejo. Al ser complejos, se explica que se duplique la utilización de recursos.

Entonces, hay que seguir reduciendo DSPS, un total de 16 como mínimo (para usar los 80 de la red pitaya).

## Optimización fina

Bloques fijos de matlab hay muchos que no se pueden modificar.

Se hicieron las siguientes optimizaciones:

* 2DSP: Se reemplazo el complex multiplier de 4 DSP por la implementación optimizada de 3 DSP.

* 12DSPs: Se reemplazo el bloque OFDM Channel Estimator por una implementanción manual que no usa DSPs.

Luego de las optimizaciones finales, el bloque del demodulador quedo así:

![Alt text](images/uu.png)

Luego de la síntesis en Vivado, la utilización superó los 80 DSPs. Eso significa que hay alguno de los bloques que usa más DSPs que multiplicadores publicita.

![Alt text](images/vv.png)

El siguiente paso es ver qué bloque está consumiendo más DSPs de los que debería, y como solucionarlo. Se sospecha que las multiplicaciones de más de 24bits pueden ser el problema, y esta imagen es la confirmación. Interesantemente, bloques como el QAM demod que ocupaba 12 multiplicadores usa 8 DSPs. Pero bueno, el siguiente paso es reducir el tamaño de ofdm symbol sync.

![Alt text](images/ww.png)

## Optimizando OFDM SS

Primero, quiero chequear si es un problema de las optimizaciones, o el tamaño de las words.

Según la documentación del DSP48, este tiene un multiplicador de "25*18" bits. Yo actualmente estoy haciendo multiplicaciones de 32 bits, así que eso explicaría el por qué de la utilización.

Este primer ejemplo viene sin optimizaciones (no adaptative o redistributed pipelining). Todos los multiplicadores son de 32x32 bits. Según Matlab, usa 11 multipliers, pero según Vivado usamos 44 (el cuádruple).

![Alt text](images/xx.png)

Este segundo respeta la arquitectura del DSP48, es decir, un multiplicador de 25*18. El resultado final utiliza 11 DSP, como es de esperarse.

![Alt text](images/yy.png)

Con respecto a la utilización de LUTs, si es necesario, se debería de reducir el tamaño de palabra del divisor:

![Alt text](images/zz.png)

Luego de compilar, se observa que el equalizer usar un multiplicador muy grande, y por eso usa DSPs de más.

![Alt text](images/11.png)

La sintesis en Vivado da los recursos, pero seguimos con sobre-uso de DSPs

![Alt text](images/22.png)

El objetivo ahora es bajar el tamaño de esos multiplicadores en el equalizer.

## Reduciendo el equalizer

Equalizer con data de 16 bits y canal de 12 bits

![Alt text](images/33.png)

Equalizer con data de 12 bits y canal de 16 bits

![Alt text](images/44.png)

Equalizer con datos y canal en 12 bits:

![Alt text](images/55.png)

Sintetizando esta última version (la cual idealmente reduce uno de los operandos por debajo de 25bits), se tiene esta utilización de recursos:

![Alt text](images/66.png)

## Reduciendo utilizacion de Luts

Venimos a esta sección luego de haber sintetizado el header y el payload, y ver que la utilización de Luts está por encima de lo que nos gustaría ver.

Actualmente, puedo estimar que la utilización está en:

* Payload: 8500
* Header: 2500
* Total disponible: 17000

Por lo tanto, el demodulator tiene que ocupar 6000 LUTs como máximo, y dejando algo de margen por acá y allá.

Primero, veamos como está la utilización actual, y que bloques necesitan ser corregidos:

![Alt text](images/77.png)

Extrañamente, aparece que los DSPs están por encima de 100%, y eso que ya habíamos corregido el tema. De todas formas, la utilización de LUTs está muy alta. Procedo a reducir el tamaño de palabra de los principales offenders:

* Channel equalization: Reemplazo el bloque por la operación matemática. No tiene sentido que ocupe 6000 LUTs si son solamente unas multiplicaciones y una division.

* Offender B

A continuación, la utilización de recursos del divisor real y complejo, al variar el tamaño de entrada y salida. Podemos ver que variar la salida no afecta tanto la utilización como disminuir el tamaño de la salida. En conclusión, conviene usar el divisor real, y disminuir al máximo posible el tamaño de entrada.

![Alt text](images/88.png)