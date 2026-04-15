extends Node2D


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.

const BULLET = preload("res://Player/Player Scene/bullet.tscn")
@onready var muzzle: Marker2D = $Muzzle
@onready var shoot_sfx: AudioStreamPlayer2D = $Shoot_Sfx

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
	
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = BULLET.instantiate()
		get_tree().root.add_child(bullet_instance)
		shoot_sfx.play()
		bullet_instance.global_position = muzzle.global_position
		bullet_instance.rotation = rotation
		
