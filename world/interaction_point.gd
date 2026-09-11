@tool
extends Marker2D
@export var action: String = ""
@export var radius: float = 30.0
@export var lateral: bool = false
func matches(point: Vector2) -> bool:
	return absf(point.x-position.x)<radius and point.y>=270 if lateral else point.distance_to(position)<radius
