# DC-OFDM

DC-OFDM implementation on Matlab/Simulink, for HDL Coder generation.

## Pasos a seguir

![Alt text](images/image.png)

![Alt text](images/image-1.png)

![Alt text](images/image-2.png)

## Cambios respecto de la IEEE

En esta sección voy a comentar todos las modificaciones que fueron necesarias hacer respecto del estándar IEEE 802.15.13.

### Cambio de las matrices LDPC

El bloque de Matlab [LDPC Encoder](https://la.mathworks.com/help/wireless-hdl/ref/ldpcencoder.html) solamente recibe matrices "dual diagonal". Las matrices del estándar fueron modificadas para que sean reconocidas por este bloque de la siguiente forma:

* En la primer columna de la matriz cuadrada de paridad, formada por "0", "-1" y dos veces un número "x", se ubica el número "x" en la primera y última fila.

* En la segunda columna de la matriz cuadrada de paridad, se reemplaza el número "x" de la última fila por un "-1".

![Double diagonal matrix](images/double_diagonal.png)

### Cyclic prefix del preamble

Según estándar, los prefijos cíclicos para los distintos elementos del PSDU son:

* Preamble = 0;
* Channel Estimation = N/4;
* Header = N/4;
* Payload = Arbitrary;

Hay un bug con el bloque de Simulink de OFDM Modulator, al poner el prefijo cíclico en "0".

Si el bloque tiene un valor de $CPLen = 0$, y luego intenta tomar cualquier otro valor, se rompe. Si el bloque tiene un valor de $CPLen != 0$, entonces puede cambiar libremente entre cualquier valor, mientras ese valor no sea cero.

Conclusión: actualmente el valor del prefijo cíclico para el preamble está en "2" en vez de "0".
