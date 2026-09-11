class_name PaseoMission
extends Node
signal travel_requested(exterior: bool, index: int, spawn: Vector2)
signal message_requested(text: String, duration: float)
signal sound_requested(cue: String)
signal lighting_changed
signal progress_changed
const ROOM_NAMES = ["Sala de estar","Cocina","Dormitorio","Baño"]
var state: SessionState
func interact(target: String) -> void:
	match target:
		"home":
			travel_requested.emit(false,0,Vector2(72,287))
		"left":
			if state.room==0:
				travel_requested.emit(true,0,Vector2(222,388))
			else:
				travel_requested.emit(false,state.room-1,Vector2(562,287))
		"right":
			travel_requested.emit(false,state.room+1,Vector2(72,287))
		"light":
			state.room_lit[state.room] = not state.room_lit[state.room]
			lighting_changed.emit()
			sound_requested.emit("success")
			message_requested.emit("" + ROOM_NAMES[state.room].to_upper() + "\n" + ("La habitación vuelve a encenderse con luz cálida." if state.room_lit[state.room] else "Solo queda la luz azul de la ventana. E vuelve a encenderla."),5)
			progress_changed.emit()
		"bed":
			if state.visited.all(func(v: bool) -> bool: return v) and state.lanterns.all(func(v: bool) -> bool: return v):
				state.complete = true
				message_requested.emit("UN PASEO BIEN HECHO\nCuatro rincones de casa. Un jardín que volvió a brillar. Ahora sí: a soñar.",30)
				sound_requested.emit("success")
				progress_changed.emit()
			else:
				message_requested.emit("TODAVÍA QUEDA UN POQUITO DE NOCHE\nVisitá las cuatro habitaciones y reactivá los tres faroles del jardín antes de descansar.",7)
		"fountain":
			message_requested.emit("LA FUENTE SUSURRA\n" + ("Las luciérnagas regresaron con la luz. Es hora de volver a tu cama." if state.lanterns.all(func(v: bool) -> bool: return v) else "Quedan faroles apagados alrededor. Buscá sus marcas doradas y acercate."),7)
		_:
			if target.begins_with("lantern"):
				var index := int(target.trim_prefix("lantern"))
				state.lanterns[index] = true
				lighting_changed.emit()
				sound_requested.emit("success")
				message_requested.emit("UNA PATITA, UNA LUZ\nFaroles encendidos: %d / 3. La plaza se siente un poco más viva." % state.lanterns.count(true),6)
				progress_changed.emit()

