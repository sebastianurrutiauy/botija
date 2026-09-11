class_name ExplorationWorld
extends Node2D
const ROOM_NAMES = ["Sala de estar","Cocina","Dormitorio","Baño"]
const FOUNTAIN = Vector2(764,175)
@export var neighborhood: PackedScene
@export var rooms: Array[PackedScene]
var state: SessionState
var active_location: ExplorationLocation
@onready var lighting: CozyLighting = %Lighting
var lights: Array[PointLight2D]:
	get: return lighting.lights

func show_place(exterior: bool, index: int) -> void:
	if active_location:
		remove_child(active_location)
		active_location.queue_free()
	active_location = (neighborhood if exterior else rooms[index]).instantiate()
	active_location.state = state
	add_child(active_location)
	move_child(active_location,0)
	lighting.state = state
	lighting.location = active_location
	rebuild_lights()

func can_walk(point: Vector2) -> bool:
	return active_location.can_walk(point)

func nearest(point: Vector2) -> String:
	return active_location.nearest(point)

func rebuild_lights() -> void:
	lighting.rebuild()

func _ready() -> void:
	if state == null:
		state = SessionState.new()
		show_place(true,0)
