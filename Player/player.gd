extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -270.0
var counter : int = 1
var can_move : bool = true

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D


func _process(delta: float) -> void:
	if Input.is_action_pressed("attack"):
		can_move = false
		sprite_2d.play("attack")
	else:
		can_move = true



func _physics_process(delta: float) -> void:
	if can_move:
	
		if not is_on_floor():
			velocity += get_gravity() * delta

	# Handle jump.
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = JUMP_VELOCITY


		var direction := Input.get_axis("left", "right")
	
		if direction > 0:
			sprite_2d.flip_h = false
		elif direction < 0:
			sprite_2d.flip_h = true
		if is_on_floor():
		
			if direction == 0:
				sprite_2d.play("idle")
		
			else:
				sprite_2d.play("run")
		
		else:
			sprite_2d.play("jump")


	
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
