class_name ExplorationCat
extends CharacterBody2D
## Un mismo actor, dos controles. Las imágenes son reemplazables.
var outdoors: bool = true
var frozen: bool = false
var walk_query: Callable
@onready var visual: Sprite2D = %Sprite
var row: int = 2
var walk_clock: float = 0.0
var meow_time: float = 0.0
var coyote: float = 0.0
var cell: Vector2

func _ready() -> void:
	cell = visual.texture.get_size()/4.0
	configure(true)

func configure(exterior: bool) -> void:
	outdoors = exterior
	velocity = Vector2.ZERO
	var target_size: float = 43.0 if outdoors else 61.0
	visual.scale = Vector2.ONE * target_size/cell.x
	visual.position = Vector2(-target_size*0.5,-target_size*0.91)
	row = 2 if outdoors else 0
	update_frame(false)

func _physics_process(delta: float) -> void:
	meow_time = maxf(0.0,meow_time-delta)
	if frozen:
		velocity = Vector2.ZERO
		queue_redraw()
		return
	var axis := Input.get_vector("left","right","up","down")
	var speed: float = 113.0 if Input.is_action_pressed("run") else 77.0
	if outdoors:
		velocity = axis*speed
		var target: Vector2 = position + velocity*delta
		if can_walk(Vector2(target.x,position.y)):
			position.x = target.x
		if can_walk(Vector2(position.x,target.y)):
			position.y = target.y
		if absf(axis.x)>0.15:
			row = 0 if axis.x>0 else 1
		elif absf(axis.y)>0.15:
			row = 2 if axis.y>0 else 3
	else:
		velocity.x = move_toward(velocity.x,axis.x*speed,delta*850)
		if absf(axis.x)>0.15:
			row = 0 if axis.x>0 else 1
		coyote = 0.1 if is_on_floor() else maxf(0,coyote-delta)
		if Input.is_action_just_pressed("jump") and coyote>0:
			velocity.y = -235
			coyote = 0
		velocity.y = minf(velocity.y+740*delta,350)
		move_and_slide()
		position.x = clampf(position.x,18,622)
		if position.y>330:
			position.y = 287
			velocity.y = 0
	var moving := axis.length()>0.1
	if moving:
		walk_clock += delta*(10.0 if Input.is_action_pressed("run") else 7.0)
	update_frame(moving)
	queue_redraw()

func update_frame(moving: bool) -> void:
	var column: int = (int(walk_clock)%3)+1 if moving else 0
	visual.region_rect = Rect2(Vector2(column*cell.x,row*cell.y),cell)

func _draw() -> void:
	draw_set_transform(Vector2(0,-1),0,Vector2(1,0.32))
	draw_circle(Vector2.ZERO,11 if outdoors else 16,Color(0.01,0.02,0.04,0.3))
	draw_set_transform(Vector2.ZERO)
	if meow_time>0:
		draw_string(ThemeDB.fallback_font,Vector2(-10,-48 if outdoors else -61),"miau",HORIZONTAL_ALIGNMENT_LEFT,-1,9,Color("ffe5ac"))


func can_walk(point: Vector2) -> bool:
	return walk_query.call(point) if walk_query.is_valid() else true
