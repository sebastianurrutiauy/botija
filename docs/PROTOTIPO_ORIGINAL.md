# Patitas de Noche · Dos Miradas

Tercer prototipo, independiente de los anteriores. Combina un barrio de vista elevada con cuatro interiores de cámara lateral. Gato naranja con hocico, pecho, patas y punta de la cola blancos, collar rojo y cascabel dorado, basado en la referencia del usuario.

## Jugar

En esta computadora, abrí **Jugar.cmd**. La primera vez importa automáticamente las imágenes; después abre el juego. Requiere el Godot 4.7.2 instalado en el Escritorio. No es una exportación standalone.

Para editar: **Abrir en Godot.cmd**, o importar **project.godot** desde Godot y presionar **F5**. Si importás el ZIP, elegí una carpeta nueva. En otro equipo, importá project.godot con Godot 4; los accesos .cmd apuntan al ejecutable de esta computadora.

## Qué probar

1. El gato comienza fuera de su casa. Acercate a la puerta y presioná E: cambia la cámara y el control.
2. Recorré **sala de estar → cocina → dormitorio → baño**. Acercate a las puertas de los extremos y usá E. Se puede regresar por las mismas conexiones.
3. Cada habitación tiene un marcador **LUZ**. E enciende/apaga sus fuentes cálidas. **L** alterna la intensidad ambiente para comparar la atmósfera.
4. Salí al barrio por la puerta izquierda de la sala. Bajá al camino principal, seguí a la derecha y subí hacia el jardín de la fuente.
5. Reactivá con E los tres faroles marcados alrededor de la fuente. Aparecen luces adicionales y luciérnagas.
6. Volvé al dormitorio y descansá con E junto a la cama para cerrar el pequeño paseo. Podés seguir explorando después.

No hay límite de tiempo ni combate. La actividad del jardín sirve para probar navegación, interacción, iluminación y regreso a casa.

## Controles

| Acción | Barrio | Interior |
|---|---|---|
| Movimiento | WASD / cuatro flechas | A-D / izquierda-derecha |
| Correr | Shift | Shift |
| Saltar | No se utiliza | Espacio |
| Interactuar | E: casa, faroles, fuente | E: puertas, luces, cama |
| Maullar | Q | Q |
| Cambiar ambiente | L | L |
| Pausa y guardado | Esc | Esc |
| Silenciar sonido | M | M |

Se guardan visitas, faroles y estado de los interruptores. **Esc → Cargar paseo** restaura un punto seguro de la ubicación guardada. Reiniciar comienza un paseo nuevo; no borra inmediatamente el guardado anterior.

## Diseño y límites

- El barrio usa cámara 2D elevada de tres cuartos; no es un mundo 3D. El movimiento se limita a caminos y plaza mediante áreas transitables, con la fuente como obstáculo.
- Los interiores usan cámara lateral fija, suelo y salto. El mobiliario del fondo es decorativo: todavía no se puede saltar encima ni empujar muebles.
- Los fondos son arte pixel art generado para este prototipo. Se dibujan con filtro nearest en un viewport de 640 × 360, ampliado a 1280 × 720.
- La iluminación mezcla el ambiente pintado de los fondos con **CanvasModulate + PointLight2D**, degradados radiales, parpadeo suave y cambios interactivos. No hay sombras dinámicas de cada mueble.
- La casa tiene cuatro escenas visuales conectadas en línea. No hay escaleras, piso superior o simulación doméstica.
- El sprite de gato tiene vistas laterales y vistas hacia arriba/abajo. La animación provisional tiene cuatro cuadros por dirección.

## Archivos

- `scripts/main.gd`: navegación de habitaciones, cambios de cámara, objetivo del paseo, interfaz y guardado.
- `scripts/cat.gd`: movimiento exterior/interior, animación y material de transparencia.
- `scripts/world.gd`: fondos, áreas transitables, luces y fuente.
- `assets/rooms.png`: atlas de sala/cocina/dormitorio/baño.
- `assets/town.png`: mapa ilustrado del barrio.
- `assets/cat.png`: atlas del gato. La imagen original conserva un damero; un material de clave de color lo oculta durante el renderizado. No confundir este recurso con un sprite PNG de alfa limpio.
- `scenes/main.tscn`: punto de entrada; muestra una vista previa del barrio en el editor. El mundo interactivo se monta con los scripts al ejecutar.
- `ARTE_Y_PROMPTS.md`: procedencia y prompts del arte.

## Comprobaciones

La prueba automatizada recorre el barrio y las cuatro habitaciones con movimiento real, usa las puertas, conmuta luces, rodea la fuente, reactiva los faroles y vuelve a la cama. No teletransporta al gato para saltear el recorrido; los cambios de posición al cruzar puertas son parte del juego. También verifica pausa, guardado y rechazo de guardados incompletos.

Después de importar los assets:

```
godot --headless --fixed-fps 60 --path RUTA_DEL_PROYECTO -- --test
```

Resultado esperado: `TOUR_COMPLETE checks=56 failures=0`.

Capturas con renderizado real (no altera el guardado):

```
godot --path RUTA_DEL_PROYECTO -- --capture
```

## Próxima evaluación

Compará si el cambio de cámara se entiende, si el tamaño del gato se siente coherente, si es fácil encontrar la salida de cada habitación y si la iluminación permite orientarse además de verse acogedora.
