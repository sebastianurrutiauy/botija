# Trabajar entre dos

Usen la misma versión de Godot (4.7.2) y clones separados. No compartan una carpeta sincronizada como copia de trabajo.

## Ciclo de trabajo

1. Sin cambios pendientes, `git switch main` y `git pull --ff-only`.
2. Crear una rama corta: `git switch -c feature/decorar-cocina`.
3. Trabajar en una funcionalidad, probar con F5 y ejecutar `tools/check.ps1`.
4. Revisar `git diff` y `git status`. Agregar solo los archivos de la tarea con `git add` y hacer `git commit -m "Añadir lámpara de cocina"`.
5. `git push -u origin feature/decorar-cocina` y abrir un pull request hacia `main`.
6. La otra persona revisa y juega el cambio antes de integrarlo.

Hasta que la arquitectura esté integrada a main, creen sus ramas desde `origin/codex/project-architecture`.

## Reparto sugerido

Una persona puede editar cocina/baño y la otra sala/barrio, cada una en sus `.tscn`. También pueden separar tareas de interfaz y movimiento. Coordinen cambios en `project.godot`, `world/world.tscn`, `game/game.gd` y `SessionState`: son puntos compartidos. No editen simultáneamente la misma escena salvo acuerdo.

Los `.tscn`, `.tres`, `.gd`, `.uid` y `.import` se versionan. No subir `.godot/`, ejecutables, guardados, credenciales ni builds. Las texturas actuales son pequeñas para Git; evaluar Git LFS si se incorporan muchos `.blend`, audio o texturas pesadas antes de agregarlos.

## Conflictos

Hacer commit o guardar el trabajo antes de actualizar la rama. Integrar `origin/main` con `git merge origin/main`, resolver cada conflicto conservando la intención de ambos cambios y volver a importar/probar. En escenas no elegir una versión entera a ciegas: revisar nodos, recursos y conexiones en Godot. Nunca forzar push sobre main/stable.

## Versiones

`main`: cambios revisados. `stable`: conservar su uso actual y actualizarla solo de común acuerdo. `sprint1`: documentación existente, intacta.

Cuando una versión pase pruebas, actualizar `config/version` en `project.godot`, agregar entrada en `CHANGELOG.md` y hacer commit. Después crear una etiqueta anotada, por ejemplo `git tag -a v0.2.0 -m "Base modular"`, y subirla con `git push origin v0.2.0`. Crear tags una vez integrado el cambio; no renombrarlos después de publicar.

Los ZIP y ejecutables corresponden a una GitHub Release, no al historial de código. Cada entrega debe indicar tag, versión del motor y resultados de pruebas.
