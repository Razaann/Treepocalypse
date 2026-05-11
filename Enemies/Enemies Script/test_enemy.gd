extends CharacterBody2D

#const SPEED: float = 300.0
const MAX_SPEED: int = 100
const ACCELERATION: int = 200
const FRICTION: int = 200

# WRONG
#var player = preload("res://Player/Player Scene/player.tscn")
#
#func _physics_process(delta: float) -> void:
	#var direction = (player.global_position - global_position).normalized()
	#if direction.length() > 0.01:
		#velocity.x = move_toward(velocity.x, MAX_SPEED * direction.x, ACCELERATION * delta)
		#velocity.y = move_toward(velocity.y, MAX_SPEED * direction.y, ACCELERATION * delta)
	#else:
		#velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		#velocity.y = move_toward(velocity.y, 0, FRICTION * delta)
	#
	#position += velocity * delta
	#
	#move_and_slide()
