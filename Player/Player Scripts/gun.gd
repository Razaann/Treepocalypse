extends Node2D

# STILL CONCEPT, TRY TO FIND A WAY TO MAKE IT INTO FSM
# SO IT'S NOT GONNA BE SPAGHETTI

const BULLET = preload("res://Player/Player Scene/bullet.tscn")
@onready var muzzle: Marker2D = $Muzzle
@onready var shoot_sfx: AudioStreamPlayer2D = $Shoot_Sfx

# THERE'S PROBABLY A BETTER WAY TO HANDLE THIS (BENERIN)
var can_shoot: bool = true
var SHOOT_COOLDOWN: float = 0.1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Use look at function so it can look toward based on vector 2
	# Which here use global mouse position
	look_at(get_global_mouse_position())
	
	# Use wrap to limit the value in range
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
	
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()

func shoot():
	can_shoot = false
	var bullet_instance = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance)
	# RANDOMIZE THE SFX PITCH (BENERIN)
	shoot_sfx.play()
	bullet_instance.global_position = muzzle.global_position
	var spread_angle = randf_range(-5, 5)
	bullet_instance.rotation = rotation + deg_to_rad(spread_angle)
	await get_tree().create_timer(SHOOT_COOLDOWN).timeout
	can_shoot = true
