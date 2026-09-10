DOCUMENTO DE DISEÑO DE JUEGO

# Patitas de Noche

*Game Design Document v0.1*

Aventura narrativa de exploración y puzzles ambientales desde la perspectiva de un gato doméstico.

| **Metadato** | **Definición** |
| --- | --- |
| Versión | 0.1 |
| Estado | Preproducción |
| Motor | Godot |
| Plataforma inicial | PC |
| Equipo | 2 desarrolladores |
| Modalidad | Un jugador |
| Dirección artística | 3D estilizado low-poly |
| Duración final | Por definir |

## Propósito

Establecer una base compartida para diseñar y validar Patitas de Noche. La prioridad de preproducción es comprobar la experiencia de ser este gato mediante la misión de las llaves antes de ampliar el contenido del juego.

El documento distingue la base de diseño, las propuestas sujetas a validación y las decisiones abiertas. La versión 0.1 no cierra la duración, el número de noches ni el desenlace.

# 1  Contenido y estado de diseño

Guía de navegación del GDD. Los títulos enlazan a cada sección; los estilos de encabezado permiten recorrer y reorganizar el documento desde el panel de navegación de Word.

[01   Contenido y estado de diseño](#1--contenido-y-estado-de-diseño)

[02   Resumen ejecutivo y visión](#2--resumen-ejecutivo-y-visión)

[03   Narrativa y personajes](#3--narrativa-y-personajes)

[04   Ciclo de juego y mundo](#4--ciclo-de-juego-y-mundo)

[05   Cámara y acciones del gato](#5--cámara-y-acciones-del-gato)

[06   Instinto Felino y experiencia de uso](#6--instinto-felino-y-experiencia-de-uso)

[07   Puzzles y progresión](#7--puzzles-y-progresión)

[08   Vertical slice de las llaves](#8--vertical-slice-de-las-llaves)

[09   Validación y producción](#9--validación-y-producción)

[10   Alcance y decisiones abiertas](#10--alcance-y-decisiones-abiertas)

## Cómo leer el estado de cada definición

| **Estado** | **Uso en la versión 0.1** |
| --- | --- |
| Base de diseño | Decisiones que orientan el proyecto y el primer desarrollo. |
| Propuesta | Detalle, ejemplo o solución por probar. No constituye una obligación de producción. |
| Abierto | Pregunta que todavía requiere una decisión de diseño o narrativa. |
| Fuera de alcance | Sistema excluido de la base actual o aplazado expresamente. |

## Control de versiones

| **Versión** | **Estado** | **Contenido** |
| --- | --- | --- |
| 0.1 | Preproducción | Visión, sistemas, vertical slice, límites y preguntas abiertas. |

# 2  Resumen ejecutivo y visión

## High concept

Patitas de Noche es una aventura narrativa de exploración y puzzles ambientales en la que un gato doméstico intenta evitar que su familia se mude. Durante el día descubre problemas humanos; por la noche explora el barrio, provoca distracciones, utiliza objetos y coopera con otros animales para resolverlos en secreto. A la mañana siguiente observa las consecuencias, mientras los humanos desconocen su participación.

## Visión del producto

La experiencia combina un barrio compacto, rutas felinas verticales y una sociedad animal absurda. Un problema cotidiano puede sentirse como una aventura enorme desde la escala del protagonista. La profundidad surge de observar comportamientos, conocer lugares y construir relaciones, con sistemas controlados que puedan desarrollar dos personas.

## Fantasía del jugador

«Soy un gato aparentemente normal que secretamente está intentando salvar su hogar». El jugador actúa con ingenio, curiosidad y lógica felina. Recuperar unas llaves puede adquirir una dimensión épica sin perder su naturaleza doméstica.

## Objetivos emocionales

La sensación principal al terminar debe ser «Qué aventura tan linda», acompañada por el disfrute del humor y de las referencias. Durante el juego se busca curiosidad al explorar, satisfacción al deducir una solución y complicidad al ver que los humanos atribuyen los resultados a otra causa.

## Pilares

| **Pilar** | **Implicación de diseño** |
| --- | --- |
| Ser un gato | El movimiento, la comunicación corporal y las acciones gratuitas deben resultar expresivos y divertidos. |
| Aventura a escala felina | Muebles, jardines y tejados ofrecen rutas, obstáculos y descubrimientos significativos. |
| Observar antes de actuar | Los puzzles vinculan entorno, objetos y comportamientos comprensibles. |
| Un mundo que recuerda | Las acciones se reflejan en relaciones, accesos, diálogos y consecuencias visibles. |

# 3  Narrativa y personajes

## Premisa y conflicto central

La familia considera mudarse porque está teniendo problemas. El gato no quiere abandonar la casa y trata de resolver esos problemas para impedirlo. Los asuntos cotidianos dan origen a las misiones y conectan la aventura nocturna con la vida familiar.

Abierto: la causa concreta de los problemas y la razón profunda del apego del gato. Puede explicarse al comienzo o revelarse gradualmente. La comprensión parcial de las conversaciones humanas y las pistas mediante recuerdos, objetos o habitaciones son propuestas narrativas, no acontecimientos cerrados.

## Reparto y comunicación

| **Personaje o grupo** | **Definición y estado** |
| --- | --- |
| Protagonista | Gato macho; apariencia naranja y blanca provisional. Nombre y diseño definitivo sin especificar. Entiende a los humanos y habla con los animales; los humanos oyen sus vocalizaciones felinas. |
| Familia | Padre, madre y dos hijos. Sus problemas impulsan las misiones. Nombres, edades, personalidades y arcos abiertos. |
| Urraca | Animal central del puzzle de las llaves; su interés por brillos y sonidos permite preparar distracciones. |
| Pato de seguridad | Impide inicialmente el acceso a la fiesta del bosque. La fiesta pertenece a la historia principal y aparece más adelante. |
| Otros animales | Toby y otras comunidades o personajes recurrentes son propuestas de desarrollo; el reparto final no está fijado. |

## Sociedad animal y realidad mágica

La sociedad animal es importante, absurda, cómica y satírica. Sus pequeñas reglas sociales exageran comportamientos humanos. Un consejo de palomas, comerciantes mapaches o gatos que disputan una caja son ejemplos propuestos, no una lista de contenido comprometido.

La realidad mágica permanece ambigua: no se confirma por completo cuánto pertenece a la realidad y cuánto a la imaginación del gato. Para el protagonista, los acontecimientos tienen valor real.

## Pregunta que sostiene el arco

¿Puede realmente el gato evitar la mudanza? El final sigue abierto. Que la familia se quede, que existan razones más profundas para marcharse o que el gato reconsidere qué significa su hogar son posibilidades, no decisiones definitivas.

# 4  Ciclo de juego y mundo

| **Fase** | **Experiencia del jugador** | **Función** |
| --- | --- | --- |
| Día | Explorar la casa, escuchar a la familia y observar pistas. | Presentar el problema y la vida doméstica. |
| Atardecer | Reconocer una situación para investigar y preparar la salida. | Transición a la aventura nocturna. |
| Noche | Explorar, conversar, deducir, experimentar y resolver. | Objetivo principal y oportunidades secundarias. |
| Regreso | Volver a casa con el resultado de la misión. | Conectar la aventura con el hogar. |
| Mañana | Ver la reacción familiar y los cambios producidos. | Recompensa narrativa y continuidad. |

El ciclo organiza las situaciones; no exige un reloj de día y noche en tiempo real. El número de noches y la duración final permanecen abiertos. También queda por decidir si la primera noche jugable es la primera salida del gato o una salida más de su rutina.

## Micro mundo semiabierto

El jugador explora entornos cerrados o espacios con libertad limitada. El mundo se compone de zonas controladas y conectadas, con acceso progresivo. La escala debe permitir encuentros, rutas alternativas y secundarias sin exigir un barrio extenso ni una simulación completa.

Propuesta de organización: casa y jardín como núcleo, conectados con pequeñas áreas exteriores, callejón, tejados y otras zonas del barrio. El bosque incorpora la fiesta en una etapa posterior. La topología exacta y la cantidad de zonas no están cerradas.

## Exploración vertical

La escala felina transforma mesas, ventanas, árboles, vallas y tejados en rutas. Explorar consiste en pasar por debajo, por encima o a través de elementos cotidianos. Conocer una conexión y descubrir un atajo constituye progreso sin desbloquear una habilidad numérica.

## Cambios persistentes

La aventura puede dejar accesos abiertos, nuevas posibilidades de cooperación y variaciones de diálogo. Las modificaciones concretas se diseñan por misión. Su propósito es que regresar a un lugar conocido revele las consecuencias de las acciones del jugador.

# 5  Cámara y acciones del gato

| **Contexto** | **Presentación** |
| --- | --- |
| Exteriores | Cámara elevada 2.5D con libertad controlada y buena lectura de rutas. |
| Interiores importantes | Vista principalmente lateral o de diorama, apta para muebles y puzzles verticales. |
| Conversaciones | Presentación de tipo visual novel. Los retratos expresivos son una propuesta del GDD. |

La cámara es híbrida y contextual. Los encuadres, las transiciones y el grado de seguimiento deben validarse en el prototipo. La configuración técnica exacta no está cerrada.

## Movimiento e interacción

El desplazamiento se combina con saltos y trepadas en puntos preparados. El jugador ejecuta acciones contextuales para recorrer rutas felinas mediante animaciones controladas. La base inicial contempla caminar, correr e interactuar con objetos; no incluye escalada libre. El mapa de controles queda por definir.

## Maullido con función sistémica

Existe un botón específico de maullido. Su uso puede atraer atención, obtener respuestas y provocar eventos de interacción o puzzle. Los humanos y los animales reaccionan según el contexto. Las variantes de maullido y la lista precisa de reacciones son propuestas por validar.

## Objetos y transporte

El gato puede transportar físicamente pocos objetos aptos, sin inventario tradicional. La propuesta inicial es llevarlos en la boca. Llaves y cucharita forman parte del caso de prueba. La capacidad exacta, las condiciones para soltar objetos y las acciones incompatibles con el transporte permanecen abiertas.

Los zarpazos y el desplazamiento de objetos interactivos permiten provocar reacciones preparadas. Las restricciones del transporte deben servir al puzzle y resultar legibles; no se presupone un sistema físico complejo.

## Sigilo y fracaso

Algunas misiones requieren sigilo contextual. Línea de visión, ruido, escondites, distracciones y rutas alternativas constituyen la propuesta de herramientas. Ser descubierto puede producir una persecución u otra consecuencia y permitir un reintento. La consecuencia puede ser cómica, pero no tiene que serlo siempre.

Quedan por precisar los puntos de recuperación y qué progreso se conserva tras fallar. Los obstáculos se resuelven con ingenio y comportamiento, sin combate tradicional ni barras de vida.

# 6  Instinto Felino y experiencia de uso

## El cuerpo del gato comunica información

El Instinto Felino permite leer sonidos, olores, peligro y puntos de interés a través del protagonista. La intención es que el jugador aprenda a observar al gato, sin depender de una visión de detective permanente ni de iconos invasivos.

| **Estímulo** | **Comunicación corporal propuesta** |
| --- | --- |
| Sonido | Orientación o movimiento de las orejas hacia la fuente. |
| Objeto o movimiento | La cabeza o la mirada siguen brevemente el punto de interés. |
| Olor | Olfateo; partículas discretas solo como posible apoyo. |
| Peligro | Orejas hacia atrás y cambio de postura. |
| Ruta potencial | Mirada breve hacia una conexión contextual. |

La mecánica es parte de la base de diseño; la asociación exacta entre estímulos y animaciones debe probarse. La distancia de cámara y la claridad de las poses determinarán qué señales se entienden durante el juego.

## Mostrar antes que explicar

La experiencia de uso prioriza composición, animación, sonido, iluminación y diálogo para orientar al jugador. Se busca minimizar marcadores, flechas, minimapas, contornos y tutoriales escritos. La cantidad de apoyo necesaria se decide al comprobar si las pistas y acciones se entienden.

## Tono y referencias

Ternura, aventura y comedia definen la identidad. La ternura surge del comportamiento felino y de los momentos domésticos; la aventura, de reinterpretar el mundo cotidiano; la comedia, del contraste entre la importancia animal y la escala humana.

La distribución conceptual es 80% humor universal, 15% adulto sutil y 5% oscuro. Este último se reserva especialmente para uno o dos personajes. El humor debe respetar los momentos emocionales.

Las referencias son indirectas, paródicas o situacionales. El chiste debe funcionar aunque el jugador no reconozca la referencia. La caja como recurso de infiltración es un ejemplo propuesto de esta lógica.

## Actividades felinas sin utilidad

Habrá acciones por el placer de ser gato, sin XP ni recompensa necesaria. Meterse en cajas, dormir, rascar, jugar o sentarse en lugares inoportunos son ejemplos candidatos. El catálogo concreto se ajustará al alcance y a las animaciones disponibles.

# 7  Puzzles y progresión

## Diseño de puzzles

Los puzzles se basan en observar el entorno y comprender comportamientos. Generalmente ofrecen dos o tres soluciones preparadas. La libertad percibida surge de descubrir alternativas diseñadas y reproducibles; no requiere una simulación emergente de combinaciones ilimitadas.

La secuencia de diseño es problema, observación, plan, acción, reacción, oportunidad y solución. El jugador debe poder relacionar una distracción con el cambio de comportamiento que abre una ruta o permite recuperar un objeto.

## Misiones principales y secundarias

Las principales se vinculan directa o indirectamente con los problemas familiares. Las secundarias desarrollan habitantes y situaciones del barrio. Pueden ofrecer diálogos, relaciones, rutas, soluciones alternativas o escenas cómicas; su contenido exacto queda por diseñar. La fiesta del bosque se reserva para la historia principal más adelante.

## Diálogo y memoria de los animales

Los diálogos son principalmente lineales, con opciones cómicas que pueden variar la reacción sin exigir ramificaciones extensas. Los animales recuerdan acciones anteriores. Esa memoria se expresa mediante diálogo y comportamiento, sin una barra visible de reputación.

Que un animal inicialmente desconfiado permita pasar después de recibir ayuda es una propuesta de aplicación. Los hechos que se registran, su persistencia y sus efectos se definirán para cada encuentro.

## Progresión sin estadísticas

| **Eje** | **Qué cambia para el jugador** |
| --- | --- |
| Conocimiento | Comprende comportamientos, pistas, rutas y posibilidades. |
| Relaciones | Los animales recuerdan acciones y modifican sus respuestas. |
| Acceso | Encuentra o habilita rutas y lugares. |
| Mundo | Descubre la sociedad nocturna y reconoce cambios del entorno. |
| Narrativa | Entiende mejor a la familia y el conflicto de la mudanza. |

No hay XP, niveles ni árboles de habilidades. La recompensa se apoya en lo aprendido, las consecuencias y el vínculo con el mundo.

# 8  Vertical slice de las llaves

## Objetivo de preproducción

Construir una porción jugable que permita responder «¿Es divertido ser este gato?». La misión de las llaves reúne exploración, observación, interacción y consecuencia familiar. La referencia inicial de 10–20 minutos corresponde solo a esta prueba; no fija la duración del juego completo.

## Recorrido base

| **Paso** | **Contenido** |
| --- | --- |
| 1  Día | En una habitación de la casa, el jugador escucha que la familia perdió las llaves. |
| 2  Atardecer | Sale hacia el jardín y una pequeña zona exterior. Que sea su primera salida queda abierto. |
| 3  Investigación | Descubre que una urraca guarda las llaves en una repisa y observa su reacción a brillos y sonidos. |
| 4  Resolución | Usa una cucharita como distracción y una ruta elevada contextual para acceder a las llaves. |
| 5  Regreso | Transporta las llaves y las deja en casa. |
| 6  Mañana | La familia las encuentra sin reconocer la intervención del gato. La escena ofrece una consecuencia visible y cómica. |

## Soluciones alternativas propuestas

Además de la distracción con un objeto brillante, se propuso provocar ruido para que Toby ladre y ahuyente a la urraca, o pedir ayuda a otro animal. Estas variantes no están cerradas. La presencia de Toby en el slice es opcional y debe justificarse por lo que permita validar.

## Contenido que debe ponerse a prueba

Movimiento; cámara exterior e interior lateral; conversación de tipo visual novel; maullido; Instinto Felino; interacción y transporte de un objeto; ruta contextual; distracción; comportamiento animal sencillo; puzzle y ciclo completo con consecuencia.

## Conexión narrativa propuesta

Una frase familiar que sugiera que otros problemas de la casa son más difíciles de resolver puede conectar el cierre con la mudanza. La frase exacta y el momento en que se presenta ese conflicto siguen abiertos. La prueba no necesita resolver el misterio del apego ni mostrar el desenlace.

# 9  Validación y producción

Los criterios siguientes convierten las preguntas del vertical slice en observaciones de prueba. No establecen todavía umbrales numéricos, tamaño de muestra ni un calendario aprobado.

| **Área** | **Criterio observable** |
| --- | --- |
| Fantasía felina | Moverse e interactuar resulta agradable y expresivo, incluso fuera del objetivo. |
| Cámara y rutas | El jugador entiende el espacio, reconoce una conexión contextual y conserva orientación al cambiar de vista. |
| Instinto Felino | Percibe las señales corporales y las relaciona con una pista o estímulo útil. |
| Puzzle y maullido | Comprende la relación entre su acción, la reacción del animal y la oportunidad creada. |
| Objeto y regreso | Puede recuperar, transportar y entregar las llaves sin perder la comprensión del objetivo. |
| Fracaso | Cuando corresponde, entiende qué ocurrió y puede volver a intentarlo. |
| Narrativa y tono | Reconoce el problema familiar y la consecuencia de la mañana; el humor acompaña la aventura. |
| Viabilidad | El equipo puede construir y ajustar el ciclo con sistemas sencillos y reutilizables. |

## Secuencia de producción propuesta

Primero validar movimiento, cámara y puzzle con formas simples. Después incorporar el arte, las animaciones y el sonido necesarios para comprobar expresividad y lectura. Ampliar el barrio y las misiones una vez que la prueba sostenga la experiencia central.

## Dirección artística

Arte 3D estilizado low-poly, con formas simples, siluetas claras y animaciones expresivas. La iluminación cálida de día y azulada o colorida de noche es una propuesta visual. No se busca realismo; la legibilidad del gato y de los elementos interactivos orienta la producción.

## Base técnica propuesta

Godot es el motor definido. La propuesta inicial contempla Blender para modelos, exportación .glb y Git para colaboración. Personaje con colisión sencilla, interacciones por áreas, rutas preparadas, estados animales simples y misiones basadas en señales forman una arquitectura candidata. El guardado de capítulo y hechos completados también es una propuesta, pendiente de especificación técnica.

# 10  Alcance y decisiones abiertas

## Fuera de alcance de la base actual

Combate tradicional; XP, niveles, estadísticas y árboles de habilidades; crafting; inventario tradicional; escalada libre; físicas complejas; mundo abierto extenso; generación procedural; necesidades de supervivencia; reputación compleja y ciclo de día y noche en tiempo real.

Los coleccionables se aplazan por el momento. Su posible incorporación futura no implica incluirlos en la versión inicial. Tampoco se fija una cantidad de noches, de animales importantes o de horas de juego.

## Reglas propuestas para controlar el alcance

Una nueva mecánica debe servir a varias situaciones. Si existe solo para un puzzle breve, se revisa la escena para resolverla con recursos disponibles. El mundo debe parecer más grande de lo que realmente es mediante verticalidad, perspectiva y reutilización de lugares.

Priorizar la validación del ciclo de las llaves antes de ampliar contenido. Mantener soluciones preparadas, comportamientos sencillos y zonas controladas. Los ejemplos de personajes, actividades o escenarios no se convierten automáticamente en compromisos de producción.

## Preguntas narrativas abiertas

| **Pregunta** | **Decisión pendiente** |
| --- | --- |
| ¿Por qué se mudan? | Problemas reales de la familia y relación con las misiones cotidianas. |
| ¿Por qué ama esta casa? | Origen del apego y forma de revelarlo, al inicio o gradualmente. |
| ¿Logrará evitar la mudanza? | Desenlace y sentido emocional del hogar, sin elegir aún una respuesta. |
| ¿Quién es cada integrante? | Nombre y personalidad del gato; identidades, conflictos y arcos familiares. |
| ¿Cómo empieza y avanza? | Primera salida o rutina previa; secuencia de noches y acceso a la fiesta. |

## Definiciones jugables por resolver

Capacidad de transporte y restricciones por objeto; controles; encuadres y transiciones; señales finales del Instinto Felino; recuperación tras el fracaso; reparto recurrente; soluciones alternativas del slice y topología del barrio. Estas decisiones se concretarán durante la preproducción sin fijar por anticipado la duración final.
