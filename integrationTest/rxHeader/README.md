# Header optimization

Camino crítico antes de optimizar.

![Alt text](images/critical_path_pre_opt.png)

El camino crítico se debe a la falta de delays a la entrada y salida del LDPC decocer. Se le agregan delays

![Alt text](images/ldpc_delays.png)

El camino crítico final queda determinado por un contador, es decir, no se puede bajar más.

![Alt text](images/critical_path_final.png)

![Alt text](images/utilization.png)

## Reduciendo la latency del LDPC decoder

Para reducir el tamaño de las RAMs, es necesario reducir el tiempo que tarda en procesar este bloque.

Según la documentación de Matlab, el delay no depende del tamaño de bits, sino de la cantidad de iteraciones.

![Alt text](images/latency.png)

## Utilizacion de LUTs en función del tamaño de palabra

Utilizando tipo de dato fixdt(1,16,10) tenemos esta utilizacion en Matlab. Notar que se utilizan dos multiplicadores de 4x32 bits.

![Alt text](images/aa.png)

La sintesis en Vivado nos dice que todo lo consume el LDPC decoder. Notar que, interesantemente, no está usando DSPs, a pesar de tener multiplicadores. Eso puede estar causando el consumo excesivo de LUTs.

![Alt text](images/bb.png)

El timing a duras penas lo cumple a 125MHz, habría que ver en la implementación, pero de momento no habría necesidad de cambiar nada.

![Alt text](images/cc.png)

Ahora voy a ir a Matlab y poner adaptative y distributed pipelining, a ver si así el Vivado reconoce los multiplicadores como DSPs. Conclusión: no cambió nada.

Ahora, reduzco el tamaño de palabra de bits a fixdt(1,4,0). Desde Matlab se ve una reducción importante en la utilización (aunque no desapareció el multiplicador):

![Alt text](images/dd.png)

![Alt text](images/ee.png)

![Alt text](images/ff.png)

Conclusión: se va a dejar operando el LDPC decoder del header con 4 bits nomás (el tipo de dato fixdt(1,4,0) es el que usa por defecto Matlab en su ejemplo, además, los valores que toma van siempre entre +2 -2).
