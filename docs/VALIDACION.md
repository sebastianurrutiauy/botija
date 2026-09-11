# Validación de la base modular

Godot 4.7.2, Windows, renderer Compatibility. Versión del proyecto: 0.2.0.

- Importación completa sin errores de scripts o recursos, repetida desde un clon limpio del commit (sin caché `.godot`).
- Recorrido automático: **60 comprobaciones, 0 fallas**. Movimiento, salto, cuatro habitaciones, puertas de ida/vuelta, interruptores, jardín, tres faroles, pausa, regreso, descanso y guardado.
- Casos adicionales: sesiones independientes, escenas instanciadas, botones traducibles sin cambiar acción, guardado incompleto y habitación fraccionaria rechazados sin alterar la partida actual.
- Capturas nuevas de barrio, jardín y cuatro habitaciones con renderizado real. Inspección visual de sala y barrio.

Los tests usan `dos_miradas_test.json`, separado de la partida del jugador. Las capturas no escriben el guardado normal. El test de error solo modifica su archivo temporal.

El entorno de ejecución aislado informa un aviso de certificado de Windows y dos instancias ObjectDB al salir de la suite; el recorrido termina con código 0. Esto no equivale a una prueba exhaustiva ni a una exportación de distribución. El proyecto debe abrirse y jugarse también desde el editor antes de una release.
