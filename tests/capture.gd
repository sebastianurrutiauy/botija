extends Node
func run(game: Node2D) -> void:
	game.cat.frozen = true
	await get_tree().create_timer(0.5).timeout
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("res://docs/previews/preview-barrio.png")
	for i in range(4):
		await game.change_place(false,i,Vector2(350,287))
		game.cat.frozen = true
		await get_tree().create_timer(0.1).timeout
		await RenderingServer.frame_post_draw
		get_viewport().get_texture().get_image().save_png("res://docs/previews/preview-room-%d.png" % i)
	game.state.lanterns.assign([true,true,true])
	game.state.garden_seen = true
	await game.change_place(true,0,Vector2(760,268))
	game.say("EL JARDÍN VUELVE A BRILLAR\nLos tres faroles despertaron a las luciérnagas. Un buen momento para regresar a casa.",20)
	game.cat.frozen = true
	game.camera.follow(game.cat,game.state.outdoors)
	game.camera.reset_smoothing()
	await get_tree().create_timer(0.1).timeout
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("res://docs/previews/preview-jardin.png")
	print("CAPTURES_OK")
	get_tree().quit()
