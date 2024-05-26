# Header Generation

La interfaz que pensé para generar el header es la siguiente:

Desde la computadora, se van a leer una serie de registros de 8 bits durante solamente un ciclo de clock. Todos esos registros se asumen que quedan almacenados por la interfaz AXI4. Los registros esperados son:

| Register | 31 | 30 |   29   |   28   |   27   |    26   |    25   |    24   |  23 |  22 |  21 |  20 |  19 |  18  |  17  |  16  |  15 |  14 |  13 |  12  |  11  |   10  |   9   |   8   |  7 |  6 |  5 |  4 |  3  |  2  |    1   |    0   |
|:--------:|:--:|:--:|:------:|:------:|:------:|:-------:|:-------:|:-------:|:---:|:---:|:---:|:---:|:---:|:----:|:----:|:----:|:---:|:---:|:---:|:----:|:----:|:-----:|:-----:|:-----:|:--:|:--:|:--:|:--:|:---:|:---:|:------:|:------:|
|   0x00   |  x |  x |    x   |    x   |    x   |    x    |    x    |    x    | p23 | p22 | p21 | p20 | p19 |  p18 |  p17 |  p16 | p15 | p14 | p13 |  p12 |  p11 |  p10  |   p9  |   p8  | p7 | p6 | p5 | p4 |  p3 |  p2 |   p1   |   p0   |
|   0x04   |  x |  x |    x   |    x   |    x   |    x    |    x    |    x    |  x  |  x  |  x  |  x  |  x  |   x  |   x  |   x  | m15 | m14 | m13 |  m12 |  m11 |  m10  |   m9  |   m8  | m7 | m6 | m5 | m4 |  m3 |  m2 |   m1   |   m0   |
|   0x08   |  x |  x |    x   |    x   |    x   | concat2 | concat1 | concat0 |  x  |  x  |  x  |  x  |  x  | rep2 | rep1 | rep0 |  x  |  x  |  x  |   x  |   x  | rate2 | rate1 | rate0 |  x |  x |  x |  x |  x  |  x  | block1 | block0 |
|   0x0c   |  x |  x | mimon2 | mimon1 | mimon0 |  mimos2 |  mimos1 |  mimos0 |  x  |  x  |  x  |  x  |  x  |  cp2 |  cp1 |  cp0 |  x  |  x  |  x  | bat4 | bat3 |  bat2 |  bat1 |  bat0 |  x |  x |  x |  x | si3 | si2 |   si1  |   si0  |


| Bits |    0    |    1    |    2    |    3   |    4   |    5   |   6  |   7  |
|:----:|:-------:|:-------:|:-------:|:------:|:------:|:------:|:----:|:----:|
|   0  |    0    |    0    |    1    |    1   |    0   |    0   |   0  |   0  |
|   8  |    p0   |    p1   |    p2   |   p3   |   p4   |   p5   |  p6  |  p7  |
|  16  |    p8   |    p9   |   p10   |   p11  |   p12  |   p13  |  p14 |  p15 |
|  24  |   p16   |   p17   |   p18   |   p19  |   p20  |   p21  |  p22 |  p23 |
|  32  |    m0   |    m1   |    m2   |   m3   |   m4   |   m5   |  m6  |  m7  |
|  40  |    m8   |    m9   |   m10   |   m11  |   m12  |   m13  |  m14 |  m15 |
|  48  |  block0 |  block1 |  rate0  |  rate1 |  rate2 |  rep0  | rep1 | rep2 |
|  56  | concat0 | concat1 | concat2 |   si0  |   si1  |   si2  |  si3 |   0  |
|  64  |   bat0  |   bat1  |   bat2  |  bat3  |  bat4  |    0   |   0  |   0  |
|  72  |   cp0   |   cp1   |   cp2   | mimos0 | mimos1 | mimos2 |   0  |   0  |
|  80  |    0    |    0    |    0    |    0   |    0   |    0   |   0  |   0  |
|  88  |    0    |    0    |    0    |    0   |    0   |    0   |   0  |   0  |
|  96  |    0    |    0    |    0    |    0   |    0   |    0   |   0  |   0  |
|  104 |    0    |    0    |  mimon0 | mimon1 | mimon2 |    0   |   0  |   0  |
|  112 |    0    |    0    |    0    |    0   |    0   |    0   |   0  |   0  |
|  120 |    0    |    0    |    0    |    0   |    0   |    0   |   0  |   0  |
|  128 |    0    |    0    |    0    |    0   |    0   |    0   |   0  |   0  |
|  136 |    0    |    0    |    0    |    0   |    0   |    0   |   0  |   0  |
|  144 |    0    |    0    |    0    |    0   |    0   |    0   |   0  |   0  |
