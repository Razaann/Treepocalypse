extends CharacterBody2D

const MAX_SPEED: int = 125
const ACCELERATION: int = 1400
const FRICTION: int = 1000

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite

func _process(delta: float) -> void:
	# Mouse position
	if get_global_mouse_position().x < global_position.x:
		player_sprite.flip_h = true
	else:
		player_sprite.flip_h = false
	
	# Move direction based on input
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity.x = move_toward(velocity.x, MAX_SPEED * direction.x, ACCELERATION * delta)
		velocity.y = move_toward(velocity.y, MAX_SPEED * direction.y, ACCELERATION * delta)
		player_sprite.play("walk")
	else:
		velocity.x = move_toward(velocity.x, MAX_SPEED * direction.x, FRICTION * delta)
		velocity.y = move_toward(velocity.y, MAX_SPEED * direction.y, FRICTION * delta)
		player_sprite.play("idle")
	
	move_and_slide()
