# HDL LDPC Encoder

Los siguientes links hacen referencia a la optimización de la lógica binaria de Karnaugh para la elección del bloque LDPC.

Las tablas tienen el siguiente formato:

| R[2] | R[1] | R[0] | K[1] | K[0] | Out[n] |
|:----:|:----:|:----:|:----:|------|--------|

Donde "R" es el code rate, y "K" es el block size (de acuerdo al estándar ieee). "Out" es el número de bloque LDPC a usar.

[MSB=Out[2]](https://tma.main.jp/logic/logic.php?lang=en&type=5&v0=a&v1=b&v2=c&v3=d&v4=e&00=x&01=x&02=x&03=x&04=0&05=0&06=x&07=x&08=0&09=0&0a=x&0b=x&0c=1&0d=1&0e=x&0f=x&10=1&11=1&12=x&13=x&14=1&15=1&16=x&17=x&18=x&19=x&1a=x&1b=x&1c=x&1d=x&1e=x&1f=x)

$Out[2] = R[1].R[0] + R[2]$

[Out[1]](https://tma.main.jp/logic/logic.php?lang=en&type=5&v0=a&v1=b&v2=c&v3=d&v4=e&00=x&01=x&02=x&03=x&04=0&05=0&06=x&07=x&08=1&09=1&0a=x&0b=x&0c=0&0d=0&0e=x&0f=x&10=0&11=0&12=x&13=x&14=0&15=0&16=x&17=x&18=x&19=x&1a=x&1b=x&1c=x&1d=x&1e=x&1f=x)

$Out[1] = R[1].\~R[0]$

[LSB=Out[0]](https://tma.main.jp/logic/logic.php?lang=en&type=5&v0=a&v1=b&v2=c&v3=d&v4=e&00=x&01=x&02=x&03=x&04=0&05=1&06=x&07=x&08=0&09=1&0a=x&0b=x&0c=0&0d=1&0e=x&0f=x&10=0&11=1&12=x&13=x&14=0&15=1&16=x&17=x&18=x&19=x&1a=x&1b=x&1c=x&1d=x&1e=x&1f=x)

$Out[0] = K[0]$
