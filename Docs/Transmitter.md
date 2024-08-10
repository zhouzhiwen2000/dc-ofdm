# Transmitter

## Inputs

* **new_frame_in**: [bool] Indica que hay un nuevo mensaje a transmitir.
* **[reg0, reg1, reg2, reg3]**: [uint32_t] Registros de configuración, por AXI4-Lite.
* **data_in**: [uint8_t] Datos a transmitir. Se espera que sean recibidos de una interfaz AXI4 Stream de 8bits.
* **valid_in**: [bool] Momento en que los datos recibidos son válidos (señal de AXI4 Stream).
* **last_frame**: Señal *TLAST* de AXI4 Stream. Indica que es el último elemento de este paquete de transmisión.

Al recibir la señal "new_frame", se van a leer los registros de 32bits (reg0, reg1, reg2 y reg3) durante solamente un ciclo de clock, por lo que los registros pueden cambiar de valor durante la transmisión de un mensaje. Estos registros se pueden implementar con AXI4-Lite, y su definición es como sigue:

| Register | 31 | 30 |   29   |   28   |   27   |    26   |    25   |    24   |  23 |  22 |  21 |  20 |  19 |  18  |  17  |  16  |  15 |  14 |  13 |  12  |  11  |   10  |   9   |   8   |  7 |  6 |  5 |  4 |  3  |  2  |    1   |    0   |
|:--------:|:--:|:--:|:------:|:------:|:------:|:-------:|:-------:|:-------:|:---:|:---:|:---:|:---:|:---:|:----:|:----:|:----:|:---:|:---:|:---:|:----:|:----:|:-----:|:-----:|:-----:|:--:|:--:|:--:|:--:|:---:|:---:|:------:|:------:|
|   0x00   |  x |  x |    x   |    x   |    x   |    x    |    x    |    x    | p23 | p22 | p21 | p20 | p19 |  p18 |  p17 |  p16 | p15 | p14 | p13 |  p12 |  p11 |  p10  |   p9  |   p8  | p7 | p6 | p5 | p4 |  p3 |  p2 |   p1   |   p0   |
|   0x04   |  x |  x |    x   |    x   |    x   |    x    |    x    |    x    |  x  |  x  |  x  |  x  |  x  |   x  |   x  |   x  | m15 | m14 | m13 |  m12 |  m11 |  m10  |   m9  |   m8  | m7 | m6 | m5 | m4 |  m3 |  m2 |   m1   |   m0   |
|   0x08   |  x |  x |    x   |    x   |    x   | concat2 | concat1 | concat0 |  x  |  x  |  x  |  x  |  x  | rep2 | rep1 | rep0 |  x  |  x  |  x  |   x  |   x  | rate2 | rate1 | rate0 |  x |  x |  x |  x |  x  |  x  | block1 | block0 |
|   0x0c   |  x |  x | mimon2 | mimon1 | mimon0 |  mimos2 |  mimos1 |  mimos0 |  x  |  x  |  x  |  x  |  x  |  cp2 |  cp1 |  cp0 |  x  |  x  |  x  | bat4 | bat3 |  bat2 |  bat1 |  bat0 |  x |  x |  x |  x | si3 | si2 |   si1  |   si0  |

## Outputs

* **data_out**: [fi(1,16,14)] Valores de salida, listos para ser transmitidos (se deben adaptar a los valores del DAC).
* **valid_out**: [bool] El valor de la salida es válido.

## Allowed parameters

No todas las funciones están funcionales o probadas, por lo que se listan las cosas que no se pueden y sí se pueden hacer:

* Máximo tamaño transmisible por trama: 2^12 bytes. Los cuellos de botella están en la RAM del transmisor y en la FIFO del receptor. Para poder transmitir tramas más grandes se deben aumentar el tamaño de ambos.

* messageDuration: En vez de usarse para indicar el tiempo que demora la transmisión, este parámetro se usa para indicar la cantidad de bytes "extra" agregados en la transmisión, para hacer que se transmita un múltiplo del fecBlockSize.

* blockSize: siempre [0, 0]

* fecRate: siempre [0 0 1]

* repetitionNumber: siempre [0 0 1]

* scramblerInitialization: cualquier valor (recomendable [1 1 1 1])

* batId: siempre [0 0 0 1 0]

* cyclicPrefixId: cualquier valor menos [0 0 0]

* explicitMimo: cualquier valor (ignorado)
