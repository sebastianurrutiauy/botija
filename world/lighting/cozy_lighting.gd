class_name CozyLighting
extends Node2D
var state: SessionState
var location: ExplorationLocation
var lights: Array[PointLight2D] = []
var time: float = 0.0
@onready var modulation: CanvasModulate = %Ambient
func glow_texture() -> GradientTexture2D:
	var gradient := Gradient.new()
	gradient.offsets = PackedFloat32Array([0,0.12,0.35,0.65,1])
	gradient.colors = PackedColorArray([Color(1,1,1,1),Color(1,1,1,0.75),Color(1,1,1,0.3),Color(1,1,1,0.065),Color(1,1,1,0)])
	var texture := GradientTexture2D.new()
	texture.gradient = gradient
	texture.width = 128
	texture.height = 128
	texture.fill = GradientTexture2D.FILL_RADIAL
	texture.fill_from = Vector2(0.5,0.5)
	texture.fill_to = Vector2(1,0.5)
	return texture

func add_light(pos: Vector2, radius: float, energy: float, color: String) -> void:
	var light := PointLight2D.new()
	light.position = pos
	light.texture = glow_texture()
	light.texture_scale = radius/64.0
	light.color = Color(color)
	light.energy = energy
	light.set_meta("base",energy)
	add_child(light)
	lights.append(light)

func rebuild() -> void:
	for light in lights:
		remove_child(light)
		light.queue_free()
	lights.clear()
	var exterior: bool = location.outdoors
	var lit: bool = exterior or state.room_lit[location.room]
	modulation.color = (Color("c4c2da") if state.ambience_soft else Color("747fba")) if exterior else (Color("c7b6aa") if lit else Color("52617d"))
	if not exterior and not state.ambience_soft:
		modulation.color = modulation.color.darkened(0.2)
	if lit:
		for i in range(location.warm_lights.size()):
			var config: Vector4 = location.warm_lights[i]
			add_light(Vector2(config.x,config.y),config.z,config.w,location.light_colors[i])
	if exterior:
		for i in range(3):
			if state.lanterns[i]:
				add_light(location.LANTERNS[i]+Vector2(0,-20),96,0.85,"ffcb81")
		if state.lanterns.all(func(v: bool) -> bool: return v):
			add_light(location.FOUNTAIN,100,0.65,"81cad5")
	else:
		add_light(Vector2(180,100),110,0.22,"87b7ed")

func _process(delta: float) -> void:
	time += delta
	for i in range(lights.size()):
		lights[i].energy = float(lights[i].get_meta("base")) * (1.0+sin(time*2.3+i*2.1)*0.025+sin(time*6.1+i)*0.012)
