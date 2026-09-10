# **Proyecto Botija — Sprints y tareas**

## **Organización del equipo**

Reparto sugerido, ajustable según experiencia:

- **Desarrollador A:** movimiento, interacción, comportamiento animal y estados de misión.
- **Desarrollador B:** escenarios, cámaras, presentación, diálogos, audio y pruebas de experiencia.

Cada sprint termina con una versión jugable integrada. Evitar que ambos editen simultáneamente la misma escena.

## **Sprint 0 — Preparación**

**Objetivo:** disponer de una base compartida que ambos puedan ejecutar.

- Acordar versión de Godot y plataforma de prueba.
- Crear proyecto y repositorio.
- Configurar controles y estructura de carpetas.
- Registrar alcance y exclusiones del MVP.
- Crear escena de arranque.
- Comprobar herramientas de exportación.

**Aceptación:** ambos abren y ejecutan la misma versión.

## **Sprint 1 — Ser un gato**

**Objetivo:** validar movimiento, escala y cámaras.

- Crear gato provisional reconocible.
- Implementar caminar y correr.
- Construir habitación y jardín con formas simples.
- Añadir cámaras exterior e interior.
- Crear una ruta vertical contextual.
- Implementar maullido básico.
- Añadir entrada y salida de una caja.

**Aceptación:** recorrer ambos espacios resulta comprensible y no genera bloqueos.

## **Sprint 2 — Una misión de principio a fin**

**Objetivo:** completar el ciclo antes de desarrollar el puzzle.

- Implementar estados de misión.
- Añadir conversación sobre las llaves.
- Preparar transición a la noche.
- Implementar recogida y transporte.
- Colocar llaves accesibles provisionalmente.
- Añadir entrega en casa.
- Crear escena de mañana y reinicio.

**Aceptación:** la misión se completa de principio a fin, aunque todavía no tenga desafío.

## **Sprint 3 — El puzzle**

**Objetivo:** introducir observación, distracción y reintento.

- Implementar estados de la urraca.
- Integrar la repisa y su ruta.
- Implementar solución de cucharita y maullido.
- Implementar solución de ruido.
- Añadir reacción ante acceso vigilado.
- Permitir reintento local.
- Proteger objetos contra pérdidas.
- Comprobar ambas soluciones desde partidas nuevas.

**Aceptación:** cualquiera de las dos soluciones permite completar el recorrido sin bloquearlo.

## **Sprint 4 — Identidad y claridad**

**Objetivo:** comprobar que la experiencia transmite el concepto del GDD.

- Añadir señales del Instinto Felino.
- Ajustar encuadres y transiciones.
- Incorporar conversación tipo visual novel.
- Mejorar poses y animaciones esenciales.
- Diferenciar iluminación de día y noche.
- Añadir sonidos funcionales.
- Ajustar reacción familiar y humor.
- Reducir explicaciones innecesarias sin perder claridad.

**Aceptación:** alguien ajeno al desarrollo puede reconocer el objetivo y las pistas principales.

## **Sprint 5 — Pruebas y entrega del MVP**

**Objetivo:** disponer de una versión estable para evaluar.

- Observar sesiones de personas que desconozcan el puzzle.
- Registrar bloqueos, confusiones y momentos satisfactorios.
- Corregir primero bloqueos de progreso.
- Ajustar tiempos de distracción y señales.
- Revisar interacciones repetidas, pausa y reinicio.
- Exportar y probar fuera del editor.
- Documentar controles y limitaciones.
- Evaluar movimiento, comprensión y disfrute.

**Aceptación:** versión distribuible que cumple los criterios del MVP, con problemas pendientes identificados.

## **Decisión después del MVP**

Antes de ampliar el juego, decidir:

- ¿El movimiento merece más iteración?
- ¿Las señales del gato se entienden?
- ¿Las dos soluciones se perciben como posibilidades razonables?
- ¿El regreso y la mañana resultan satisfactorios?
- ¿El coste de producir una misión es sostenible para dos personas?

Si la experiencia central falla, dedicar el siguiente sprint a corregirla.

## **Sprints posteriores para desarrollar el juego**

| **Etapa** | **Trabajo principal** | **Condición para avanzar** |
| --- | --- | --- |
| Narrativa y mundo | Definir causas de la mudanza, apego, familia y arco; decidir cuándo cerrar el final | Las misiones tienen una función narrativa comprensible |
| Flujo de producción | Preparar recursos reutilizables, guardado y herramientas de diálogos y misiones | Una segunda misión puede producirse sin rehacer la base |
| Expansión del barrio | Incorporar zonas, atajos y encuentros de forma incremental | Cada nueva zona aporta exploración o contenido significativo |
| Relaciones y secundarias | Añadir memoria de acciones y pequeñas historias | Los cambios se comunican y se guardan correctamente |
| Fiesta del bosque | Integrar el pato y el acceso posterior al evento principal | Su lugar en la historia está definido |
| Contenido completo | Construir y conectar las misiones elegidas | El juego puede recorrerse desde el inicio hasta el desenlace |
| Pulido y lanzamiento | Rendimiento, accesibilidad, controles, errores, presentación y distribución | La versión supera pruebas completas y está preparada para publicarse |

El número de sprints de contenido se determina después del MVP, usando el coste real de producir una misión. No se fija todavía la duración final del juego.
