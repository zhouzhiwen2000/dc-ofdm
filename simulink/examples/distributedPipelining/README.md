# Adaptative and distributed pipelining

Adaptative and/or distributed pipelining es una técnica que inserta u ordena los delays para mejorar el timing y la utilización de recursos.

Bloque base con delay adelante:
![Alt text](images/base_block.png)

Bloque generado con adaptative y distributed pipelining:

![Alt text](images/adaptative_and_distributed_pipelining.png)

Bloque generado con solamente distributed pipelining:

![Alt text](images/distributed_pipelining.png)

Bloque generado con solamente adaptative pipelining:

![Alt text](images/adaptative_pipelining.png)

Bloque base sin delay:

![Alt text](images/base_sin_delay.png)

Bloque generado con adaptative pipelining para la base sin delay:

![Alt text](images/adaptative_pipelining_sin_delay.png)

Bloque generado con distributed pipelining para la base sin delay:

![Alt text](images/distributed_pipelining_sin_delay.png)

Conclusiones:

* Distributed pipelining mueve los delays ya existentes en el código, el resultado es exactamente el mismo.

* Adaptative pipelining inserta delays en el diseño para optimizar el área y el timing. El timing del bloque final puede verse modificado.
