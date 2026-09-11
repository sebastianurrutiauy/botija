class_name ExplorationLocation
extends Node2D
@export var outdoors: bool = false
@export var room: int = 0
@export var warm_lights: Array[Vector4] = []
@export var light_colors: PackedStringArray = []
var state: SessionState = SessionState.new()
var time: float = 0.0
@onready var bg: Sprite2D = %Background
const HOME = Vector2(222,359)
const FOUNTAIN = Vector2(764,175)
const LANTERNS = [Vector2(650,157),Vector2(875,157),Vector2(763,247)]
@export var walk_areas: Array[Rect2] = []

func nearest(point: Vector2) -> String:
	for spot in %Interactions.get_children():
		if spot.matches(point):
			return spot.action
	return ""

func _process(delta: float) -> void:
	time += delta
	queue_redraw()

func can_walk(point: Vector2) -> bool:
	if point.distance_to(FOUNTAIN)<46:
		return false
	for rect in walk_areas:
		if rect.has_point(point):
			return true
	return false

func marker(pos: Vector2, text: String, active: bool = false) -> void:
	var color := Color("f5d292") if not active else Color("9dddca")
	draw_arc(pos,11,0,TAU,24,Color(color,0.75),1)
	draw_circle(pos,3,color)
	draw_string(ThemeDB.fallback_font,pos+Vector2(15,4),text,HORIZONTAL_ALIGNMENT_LEFT,-1,9,color)

func _draw() -> void:
	if not is_instance_valid(bg) or state == null:
		return
	if outdoors:
		marker(HOME,"CASA")
		for i in range(3):
			marker(LANTERNS[i],str(i+1),state.lanterns[i])
			if state.lanterns[i]:
				draw_rect(Rect2(LANTERNS[i]+Vector2(-3,-28),Vector2(6,10)),Color("ffe5a7"))
		if state.lanterns.all(func(v: bool) -> bool: return v):
			for i in range(12):
				var angle: float = time*0.25+i*TAU/12
				var pos: Vector2 = FOUNTAIN+Vector2(cos(angle)*62,sin(angle)*37-8)
				draw_circle(pos,1.4,Color(1,0.87,0.42,0.55+sin(time*2+i)*0.25))
		for i in range(3):
			var radius: float = fmod(time*5+i*9,27)
			draw_set_transform(FOUNTAIN+Vector2(0,-1),0,Vector2(1,0.45))
			draw_arc(Vector2.ZERO,radius,0,TAU,32,Color(0.5,0.8,0.95,(1-radius/28)*0.28),1)
		draw_set_transform(Vector2.ZERO)
	else:
		# Puertas superpuestas sobre el fondo: entradas jugables inequívocas.
		for x in [12,603]:
			if x==603 and room==3:
				continue
			draw_rect(Rect2(x,207,25,81),Color("2b3540"))
			draw_rect(Rect2(x,205,25,3),Color("c3a27d"))
			draw_rect(Rect2(x,207,3,81),Color("c3a27d"))
			draw_rect(Rect2(x+23,207,3,81),Color("c3a27d"))
			draw_circle(Vector2(x+18,250),2,Color("f6cf8e"))
		marker(Vector2(440,283),"LUZ",state.room_lit[room])
		if room==2:
			marker(Vector2(275,283),"DESCANSAR")
