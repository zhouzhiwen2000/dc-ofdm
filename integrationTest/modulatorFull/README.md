# Modulator optimization

Al compilar sin optimizaciones, obtenemos un buen resultado.

![Alt text](images/aa.png)

El camino crítico aparece en la entrada del modulador de OFDM, por lo que me es sencillo agregar delays a la entrada del bloque y correr devuelta la compilación.

Haciendo eso, ganamos algunos décimas de nanosegundo extras. Ya la limitación la impone el bloque modulador de OFDM, por lo que no se puede hacer más al respecto.

![Alt text](images/bb.png)

Ahora, utilizando los tres tipos de pipelining, no cambia el camino crítico, y la simulación corre bien. Esto es porque el camino crítico dependía del bloque OFDM, el cual no puede ser optimizado.
