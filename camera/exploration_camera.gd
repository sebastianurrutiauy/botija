class_name ExplorationCamera
extends Camera2D
func follow(actor: Node2D, exterior: bool) -> void:
	position = Vector2(clampf(actor.position.x,320,640),clampf(actor.position.y-20,180,460)) if exterior else Vector2(320,180)
