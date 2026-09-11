class_name ExplorationGame
extends Node2D
const SaveService = preload("res://systems/save_service.gd")
var state: SessionState = SessionState.new()
var busy: bool = false
var notice: float = 0
var save_path: String = "user://dos_miradas.json"
@onready var world: ExplorationWorld = %World
@onready var cat: ExplorationCat = %Cat
@onready var camera: ExplorationCamera = %ExplorationCamera
@onready var sound: ExplorationSound = %Sound
@onready var hud: ExplorationHUD = %HUD
@onready var mission: PaseoMission = %PaseoMission

func _ready() -> void:
	if "--test" in OS.get_cmdline_user_args():
		save_path = "user://dos_miradas_test.json"
	mission.state = state
	mission.travel_requested.connect(change_place)
	mission.message_requested.connect(say)
	mission.sound_requested.connect(sound.tone)
	mission.lighting_changed.connect(world.rebuild_lights)
	mission.progress_changed.connect(_on_progress_changed)
	world.state = state
	world.show_place(true,0)
	cat.walk_query = world.can_walk
	hud.menu_selected.connect(menu_action)
	camera.follow(cat,true)
	update_ui()
	say("UN MISMO GATO. DOS MIRADAS.\nEntrá a tu casa con E o seguí el camino hacia el jardín de la fuente.",9)
	if "--test" in OS.get_cmdline_user_args():
		call_deferred("run_tests")
	if "--capture" in OS.get_cmdline_user_args():
		call_deferred("run_capture")

func nearest() -> String:
	return world.nearest(cat.position)

func _process(delta: float) -> void:
	if get_tree().paused:
		return
	camera.follow(cat,state.outdoors)
	notice -= delta
	if notice<=0:
		hud.dialog.text = guidance()
	if state.outdoors and cat.position.x>620 and cat.position.y<305 and not state.garden_seen:
		state.garden_seen = true
		say("EL JARDÍN DE LAS LUCIÉRNAGAS\nTres faroles se apagaron. Sus pequeños interruptores están al alcance de una patita.",9)
		save_game()
	var target := nearest()
	if target.begins_with("lantern"):
		var index := int(target.trim_prefix("lantern"))
		hud.prompt.text = "E · Observar farol encendido" if state.lanterns[index] else "E · Reactivar farol"
	elif target=="left":
		hud.prompt.text = "E · Salir al barrio" if state.room==0 else "E · Ir a " + world.ROOM_NAMES[state.room-1]
	elif target=="right":
		hud.prompt.text = "E · Ir a " + world.ROOM_NAMES[state.room+1]
	else:
		hud.prompt.text = {"home":"E · Entrar a casa / cámara lateral","light":"E · Encender o apagar la luz","bed":"E · Descansar","fountain":"E · Escuchar la fuente"}.get(target,"")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("menu") and not busy:
		set_paused(not get_tree().paused)
		return
	if event.is_action_pressed("mute"):
		AudioServer.set_bus_mute(0,not AudioServer.is_bus_mute(0))
	if get_tree().paused or busy:
		return
	if event.is_action_pressed("interact"):
		interact(nearest())
	if event.is_action_pressed("light_mode"):
		state.ambience_soft = not state.ambience_soft
		world.rebuild_lights()
		say("LUZ AMBIENTE\n" + ("Noche suave: luz cálida y sombras legibles." if state.ambience_soft else "Noche profunda: más contraste entre la luna y los faroles."))
	if event.is_action_pressed("meow"):
		cat.meow_time = 1.4
		sound.tone("meow")
		say("Miau. El barrio responde con silencio... y un cascabel.",3)

func interact(target: String) -> void:
	if busy or get_tree().paused or target.is_empty() or target != nearest():
		return
	mission.interact(target)

func _on_progress_changed() -> void:
	update_ui()
	save_game()

func change_place(exterior: bool, index: int, spawn: Vector2) -> void:
	if busy:
		return
	busy = true
	cat.frozen = true
	var tween := create_tween()
	tween.tween_property(hud.fade,"color:a",1.0,0.22)
	await tween.finished
	state.outdoors = exterior
	state.room = index
	world.show_place(state.outdoors,state.room)
	cat.configure(state.outdoors)
	cat.position = spawn
	if not state.outdoors:
		state.visited[state.room] = true
	camera.follow(cat,state.outdoors)
	camera.reset_smoothing()
	update_ui()
	say("EL BARRIO / VISTA ELEVADA\nWASD para pasear. El camino de la derecha lleva al jardín de la fuente." if state.outdoors else world.ROOM_NAMES[state.room].to_upper()+" / VISTA LATERAL\nA y D para moverte, Espacio para saltar. Las puertas conectan las habitaciones.",6)
	save_game()
	tween = create_tween()
	tween.tween_property(hud.fade,"color:a",0.0,0.25)
	await tween.finished
	cat.frozen = false
	busy = false

func guidance() -> String:
	if state.complete:
		return "EL FINAL DE UN PEQUEÑO PASEO\nPodés seguir explorando o reiniciar desde Esc. Las luces conservan tus cambios."
	if state.outdoors:
		return "CAMINOS CON LUZ\nCasa al oeste. Jardín y fuente al este. L alterna entre noche suave y noche profunda."
	return "SALA  ↔  COCINA  ↔  DORMITORIO  ↔  BAÑO\nAcercate a una puerta y usá E. Las luces también tienen un punto de interacción."

func update_ui() -> void:
	hud.place_label.text = "DOS MIRADAS / BARRIO · VISTA ELEVADA" if state.outdoors else "DOS MIRADAS / " + world.ROOM_NAMES[state.room].to_upper() + " · LATERAL"
	hud.goal_label.text = "Un paseo bien hecho.\nSeguí disfrutando del barrio." if state.complete else "Casa: %d/4 habitaciones\nJardín: %d/3 faroles" % [state.visited.count(true),state.lanterns.count(true)]
	hud.controls.text = "WASD / flechas  pasear     E  interactuar     Q  maullar     SHIFT  correr     L  ambiente     ESC  menú" if state.outdoors else "A D / ← →  mover     ESPACIO  saltar     E  puertas / luces     Q  maullar     L  ambiente     ESC  menú"

func say(value: String, duration: float = 5.0) -> void:
	hud.dialog.text = value
	notice = duration

func set_paused(value: bool) -> void:
	get_tree().paused = value
	hud.show_pause(value)

func menu_action(value: String) -> void:
	match value:
		"resume":
			set_paused(false)
		"load":
			load_game()
		"restart":
			get_tree().paused = false
			get_tree().reload_current_scene()
		"quit":
			get_tree().quit()

func load_game() -> bool:
	if not FileAccess.file_exists(save_path):
		hud.menu_title.text = "Todavía no hay guardado"
		return false
	var data: Dictionary = SaveService.read(save_path)
	if data.is_empty():
		return false
	var loaded_room: int = int(data["room"])
	state.visited.assign(data["visited"])
	state.lanterns.assign(data["lanterns"])
	state.room_lit.assign(data["lights"])
	state.garden_seen = bool(data.get("garden",false))
	state.complete = bool(data.get("complete",false))
	state.outdoors = data["outdoors"]
	state.room = loaded_room
	world.show_place(state.outdoors,state.room)
	cat.configure(state.outdoors)
	cat.position = Vector2(222,388) if state.outdoors else Vector2(75,287)
	cat.frozen = false
	camera.follow(cat,state.outdoors)
	camera.reset_smoothing()
	set_paused(false)
	update_ui()
	say("PASEO RECUPERADO\nLas habitaciones visitadas y los faroles encendidos siguen como los dejaste.")
	return true

func run_tests() -> void:
	var runner: Node = load("res://tests/tour.gd").new()
	add_child(runner)
	runner.run(self)

func save_game() -> void:
	if "--capture" in OS.get_cmdline_user_args():
		return
	var error := SaveService.write(save_path,state)
	if error != OK:
		say("No se pudo guardar el paseo. Revisá el espacio y permisos de la carpeta de usuario.")
		push_warning("Save failed: " + error_string(error))

func run_capture() -> void:
	var runner: Node = load("res://tests/capture.gd").new()
	add_child(runner)
	runner.run(self)
