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

Por lo tanto, se recomienda:

