# Arquitectura de la base

## Escena principal

```text
Game (game/game.tscn)
├── World (world/world.tscn)
│   ├── Location activa (uno de cinco PackedScene)
│   │   ├── Background
│   │   ├── Floor / Collision (interiores)
│   │   └── Interactions / Marker2D
│   └── Lighting / Ambient
├── Cat (actors/cat/cat.tscn)
├── ExplorationCamera
├── Sound
├── HUD
│   └── PauseMenu (escena independiente)
└── PaseoMission
```

`Game` compone los módulos y coordina entrada/salida, pausa y guardado. Una instancia nueva de `SessionState` pertenece a cada partida; World y Paseo reciben esa misma instancia explícitamente. No hay autoload que acumule referencias visuales ni un bus global innecesario.

`PaseoMission` contiene las condiciones y respuestas de la misión. Emite `travel_requested`, `message_requested`, `sound_requested`, `lighting_changed` y `progress_changed`. No conoce al gato, al HUD ni al árbol principal. Game conecta esas señales con las operaciones adecuadas. La interfaz emite acciones estables (`resume`, `load`, `restart`, `quit`), independientes del texto visible de los botones.

El gato recibe una `Callable` de consulta del suelo transitable; no conoce la clase del barrio. Su escena puede abrirse sola con F6. Cámara, audio y HUD tienen sus propias escenas. Las referencias internas usan nombres únicos de escena.

## Editar escenarios sin pisarse

Cada habitación tiene su propio `.tscn`, atlas del fondo, suelo, luces cálidas y puntos `Marker2D`. Podés mover el interruptor o una puerta desde el editor. La propiedad `action` identifica el comportamiento; `radius` define el alcance y `lateral` si se evalúa sobre el suelo interior. El orden de los puntos define prioridad cuando sus radios se superponen.

`world/world.tscn` registra el barrio y el array de cuatro habitaciones. Solo se instancia la ubicación activa; al cambiar se retira y libera la anterior. `cozy_lighting.gd` consume los parámetros de iluminación de la ubicación. Los faroles de misión y la fuente conservan reglas específicas del paseo.

Las regiones transitables del barrio se editan en `walk_areas` de su escena. Los interiores tienen suelo físico. Los marcadores decorativos de puertas y luces aún se dibujan en `location.gd`; al cambiar su diseño, revisar también las posiciones de interacción.

## Agregar contenido

Para decorar cocina: abrir `world/kitchen/kitchen.tscn`, agregar nodos bajo su raíz y probar F6/F5. Para una nueva interacción: agregar un punto con acción nueva y extender `game/paseo/paseo.gd` o crear otra misión. Para modificar movimiento: `actors/cat/cat.gd`; para menú: `ui/pause_menu.tscn` y su script.

Agregar una quinta habitación requiere cambiar el catálogo, las conexiones de puertas, el objetivo y el esquema de guardado; no basta agregarla al array. Esta versión conserva los cuatro índices de sala/cocina/dormitorio/baño para cargar partidas anteriores. Cuando se amplíe el mapa, migrar a IDs persistentes y aumentar `version` en SaveService con migración explícita.

## Persistencia y límites

SaveService valida todo el documento antes de que Game cambie el estado. No ejecuta scripts ni carga recursos a partir del JSON. Un archivo corrupto no sustituye la sesión actual. Las pruebas usan otro nombre de archivo; las capturas no guardan progreso.

Se mantienen las mecánicas y assets del prototipo original. No se incorporan networking, plugins en tiempo de ejecución ni sistemas de inventario prematuros. Para animación o locomoción más complejas, el siguiente límite natural será separar movimiento y presentación del gato.

## Lineamientos

Se consultó [godot-master](https://github.com/thedivergentai/gd-agentic-skills/tree/main/skills/godot-master), especialmente Foundations, Composition y Signals: organización por funcionalidades, escenas compuestas, dependencias explícitas, señales de intención y datos separados. La skill es una herramienta de desarrollo instalada en Codex; el juego no depende de ella.
