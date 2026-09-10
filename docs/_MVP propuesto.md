# **Proyecto Botija— MVP propuesto**

## **1. Objetivo**

Construir una pequeña aventura completa en Godot para PC, de un jugador, con inicio, exploración, un puzzle con dos soluciones, regreso y consecuencia narrativa.

La prueba debe responder:

**¿Es divertido ser este gato y resolver un problema doméstico mediante observación e ingenio?**

La referencia de 10–20 minutos corresponde únicamente a esta experiencia de prueba. No define la duración del juego completo.

## **2. Experiencia jugable**

### **Día — El problema**

El gato comienza en una habitación de su casa. Una conversación breve permite entender que faltan las llaves.

El jugador aprende a desplazarse, maullar e interactuar. Puede realizar una acción felina opcional: meterse en una caja.

Una conversación puede insinuar problemas familiares, pero no confirma las razones de la mudanza ni el desenlace.

### **Atardecer — La salida**

Al interactuar con una salida preparada, cambia la iluminación y comienza la noche. No existe un reloj continuo.

### **Noche — La investigación**

El jugador explora un jardín compacto. Una urraca guarda las llaves en una repisa elevada.

El entorno presenta:

- Una ruta contextual hacia la repisa.
- Una cucharita que atrae la atención de la urraca.
- Un objeto que produce ruido al recibir un zarpazo.
- Un punto seguro desde el que observar.

La urraca reacciona de forma clara a los estímulos. El gato orienta sus orejas y mirada para señalar información relevante.

### **El puzzle — Dos soluciones propuestas**

**Solución A: distracción brillante.**\
Transportar la cucharita hasta un lugar preparado, soltarla y maullar para llamar la atención de la urraca. Mientras investiga, acceder a las llaves.

**Solución B: distracción sonora.**\
Golpear un objeto sonoro para que la urraca abandone temporalmente la repisa. Aprovechar la oportunidad para subir y recuperar las llaves.

Ambas soluciones utilizan estados y reacciones preparados. No requieren física compleja.

Si el gato intenta acceder mientras la urraca vigila, ella lo interrumpe y el gato vuelve a un punto seguro. Puede reintentar sin reiniciar toda la misión.

### **Regreso — La entrega**

El gato lleva las llaves a la casa y las deja en un punto reconocible. Solo puede transportar un objeto a la vez en este prototipo.

### **Mañana — La consecuencia**

La familia encuentra las llaves y atribuye su aparición a un descuido humano. El gato permanece cerca, aparentemente ajeno.

La experiencia termina con una opción para volver a jugar.

## **3. Alcance del MVP**

| **Área** | **Implementación mínima** |
| --- | --- |
| Espacios | Una habitación, un jardín y una repisa integrada en el jardín |
| Protagonista | Gato provisional naranja y blanco construido con formas simples |
| Movimiento | Caminar, correr y recorrer conexiones verticales contextuales |
| Interacción | Un botón contextual para recoger, soltar, salir y entregar |
| Maullido | Botón dedicado; la urraca responde según su estado |
| Objetos | Llaves, cucharita y objeto sonoro |
| Transporte | Un objeto visible en la boca, sin inventario |
| Instinto Felino | Una señal de atención y otra de peligro |
| Urraca | Estados de vigilancia, investigación y regreso |
| Diálogos | Presentación sencilla de tipo visual novel con texto y retrato provisional |
| Cámara | Exterior elevado; interior lateral; conversación en interfaz |
| Fracaso | Reposición segura y reintento local |
| Progresión | Estados de misión y consecuencias; sin XP |
| Actividad gratuita | Entrar en una caja, sin recompensa |
| Presentación | Formas low-poly, iluminación de día y noche, sonidos básicos |
| Entrega | Proyecto editable y versión ejecutable para PC |

## **4. Fuera del MVP**

- Toby y otros animales adicionales.
- Fiesta del bosque y pato de seguridad.
- Misiones secundarias.
- Barrio ampliado.
- Sistema general de relaciones.
- Coleccionables.
- Combate, crafting y necesidades de supervivencia.
- Escalada libre y física avanzada.
- Guardado persistente entre sesiones.
- Arte definitivo, doblaje y cinemáticas elaboradas.
- Resolución del conflicto de la mudanza.

Estas exclusiones limitan el prototipo; no eliminan elementos del GDD.

## **5. Criterios de aceptación**

El MVP está terminado cuando:

- Se puede completar el ciclo día → noche → regreso → mañana.
- Cada solución del puzzle funciona desde una partida nueva.
- El maullido produce una reacción útil y comprensible.
- Se puede reconocer la ruta elevada y recorrerla sin quedar atrapado.
- Las señales del gato ayudan a detectar atención o peligro.
- Las llaves no pueden perderse fuera del espacio accesible.
- El fracaso permite reintentar sin bloquear la misión.
- Los diálogos y cambios de cámara devuelven correctamente el control.
- La consecuencia familiar solo aparece después de entregar las llaves.
- La versión ejecutable funciona sin abrir el editor.

La calidad de la experiencia se valida observando a personas que no conozcan la solución: dónde se detienen, qué pistas interpretan y si entienden la consecuencia de sus acciones.
