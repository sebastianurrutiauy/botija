extends Node
## Recorrido por ambas cámaras con input real. No saltea puertas ni faroles.
var failures: int = 0
var checks: int = 0

func check(ok: bool, description: String) -> void:
	checks += 1
	if ok:
		print("PASS: ",description)
	else:
		failures += 1
		push_error("FAIL: " + description)

func release_all() -> void:
	for action in ["left","right","up","down","jump","run"]:
		Input.action_release(action)

func walk(game: Node2D, target: Vector2, budget: int = 650) -> bool:
	while budget>0:
		var delta: Vector2 = target-game.cat.position
		if absf(delta.x)<4 and (not game.state.outdoors or absf(delta.y)<4):
			break
		for action in ["left","right","up","down"]:
			Input.action_release(action)
		if absf(delta.x)>3:
			Input.action_press("right" if delta.x>0 else "left")
		if game.state.outdoors and absf(delta.y)>3:
			Input.action_press("down" if delta.y>0 else "up")
		await get_tree().physics_frame
		budget -= 1
	release_all()
	await get_tree().create_timer(0.1).timeout
	return absf(game.cat.position.x-target.x)<10 and (not game.state.outdoors or absf(game.cat.position.y-target.y)<10)

func use(game: Node2D) -> void:
	game.interact(game.nearest())
	await get_tree().create_timer(0.65).timeout

func run(game: Node2D) -> void:
	await get_tree().create_timer(0.1).timeout
	var independent := SessionState.new()
	independent.visited[0] = true
	check(not game.state.visited[0],"Las partidas tienen estado independiente")
	check(game.cat.scene_file_path != "" and game.hud.menu.scene_file_path != "","Jugador y pausa provienen de escenas independientes")
	var choices: Array[String] = []
	var record := func(action: String) -> void: choices.append(action)
	var isolated_menu: PauseMenu = load("res://ui/pause_menu.tscn").instantiate()
	add_child(isolated_menu)
	isolated_menu.action_selected.connect(record)
	isolated_menu.resume_button.text = "Continuar traducido"
	isolated_menu.resume_button.pressed.emit()
	check(choices == ["resume"],"Traducir botones no modifica sus acciones")
	isolated_menu.action_selected.disconnect(record)
	isolated_menu.free()
	check(game.state.outdoors and game.cat.outdoors,"Inicio en barrio con control en cuatro direcciones")
	check(not game.world.can_walk(Vector2(450,330)),"El río no es transitable")
	check(not game.world.can_walk(game.world.FOUNTAIN),"La fuente tiene volumen no transitable")
	check(await walk(game,Vector2(222,365)),"La puerta de casa se alcanza desde la vereda")
	check(game.nearest()=="home","La puerta se reconoce por proximidad")
	await use(game)
	check(not game.state.outdoors and not game.cat.outdoors and game.state.room==0,"Entrar cambia a cámara y control lateral")
	check(game.camera.position==Vector2(320,180),"La cámara interior encuadra toda la habitación")
	Input.action_press("jump")
	await get_tree().create_timer(0.22).timeout
	check(game.cat.position.y<275,"El salto lateral funciona")
	release_all()
	await get_tree().create_timer(0.6).timeout
	for i in range(4):
		check(game.world.active_location.scene_file_path != "" and game.world.active_location.room == i and game.state.room==i and game.state.visited[i],"Habitación visitable: " + game.world.ROOM_NAMES[i])
		check(await walk(game,Vector2(440,288)),"Se llega al interruptor de la habitación %d" % i)
		var lights_before: int = game.world.lights.size()
		await use(game)
		check(not game.state.room_lit[i] and game.world.lights.size()<lights_before,"Apagar cambia las luces reales en la habitación %d" % i)
		await use(game)
		check(game.state.room_lit[i],"La luz se puede volver a encender")
		if i<3:
			check(await walk(game,Vector2(610,288)),"La puerta siguiente es accesible")
			await use(game)
	check(game.state.visited.count(true)==4,"Las cuatro habitaciones cuentan para la exploración")
	for i in [3,2,1]:
		if i==2:
			await walk(game,Vector2(275,288))
			await use(game)
			check(not game.state.complete,"Descansar antes de visitar el jardín no completa el paseo")
		await walk(game,Vector2(27,288))
		await use(game)
		check(game.state.room==i-1,"La conexión de vuelta entre habitaciones funciona")
	await walk(game,Vector2(27,288))
	await use(game)
	check(game.state.outdoors and game.cat.outdoors,"Salir restaura la cámara elevada y control en cuatro direcciones")
	for point in [Vector2(222,440),Vector2(766,440),Vector2(766,320),Vector2(763,263)]:
		check(await walk(game,point),"Camino transitable al jardín: " + str(point))
	check(game.state.garden_seen,"Se descubre el punto de interés")
	check(game.nearest()=="lantern2","Se puede tocar el farol del sur")
	await use(game)
	check(game.state.lanterns[2],"Primer farol reactivado")
	for point in [Vector2(650,270),Vector2(650,175)]:
		check(await walk(game,point),"Se puede rodear la fuente por el oeste")
	await use(game)
	check(game.state.lanterns[0],"Segundo farol reactivado")
	for point in [Vector2(650,100),Vector2(875,100),Vector2(875,175)]:
		check(await walk(game,point),"Se puede rodear la fuente por el norte")
	await use(game)
	check(game.state.lanterns.count(true)==3 and game.world.lights.size()==10,"Tres faroles encienden la luz de la fuente")
	game.set_paused(true)
	var start: Vector2 = game.cat.position
	Input.action_press("right")
	await get_tree().create_timer(0.25,true).timeout
	release_all()
	check(game.cat.position==start,"La pausa detiene al gato")
	game.set_paused(false)
	for point in [Vector2(875,275),Vector2(766,280),Vector2(766,440),Vector2(222,440),Vector2(222,365)]:
		check(await walk(game,point),"Regreso a casa: " + str(point))
	await use(game)
	for i in range(2):
		await walk(game,Vector2(610,288))
		await use(game)
	await walk(game,Vector2(275,288))
	await use(game)
	check(game.state.complete,"El paseo termina en la cama después de explorar ambas cámaras")
	game.state.complete = false
	check(game.load_game() and game.state.complete and game.state.room==2,"El guardado recupera progreso y habitación")
	var file := FileAccess.open(game.save_path,FileAccess.WRITE)
	file.store_string('{"version":1,"visited":[]}')
	file.close()
	check(not game.load_game() and game.state.complete,"Un guardado incompleto no destruye la partida")
	game.save_game()
	var invalid: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(game.save_path))
	invalid["room"] = 1.5
	file = FileAccess.open(game.save_path,FileAccess.WRITE)
	file.store_string(JSON.stringify(invalid))
	file.close()
	check(not game.load_game() and game.state.room == 2,"Un índice fraccionario no se convierte en otra habitación")
	DirAccess.remove_absolute(game.save_path)
	print("TOUR_COMPLETE checks=",checks," failures=",failures)
	get_tree().quit.call_deferred(0 if failures==0 else 1)
