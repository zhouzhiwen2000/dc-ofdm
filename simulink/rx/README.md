# Optimización del receptor

Empezamos con esta tabla de utilización, que viene después de todos los pasos descriptos en el test de integración del :

![Alt text](images/aa.png)

Lo que se quiere lograr es reducir la utilización de recursos del header y del payload, posiblemente reduciendo el tamaño de palabra de entrada. Además, me quiero asegurar que realmente no usan DSPs. Su utilización de recursos alta depende solamente del LDPC decoder.

Algo que llama la atención es que el Demodulador sólo entró en recursos, pero ahora el demodulador con otras cosas no entra. Hay que revisar bien por qué es esto.

Ir al README del rxHeader para ver la optimización del LDPC.
