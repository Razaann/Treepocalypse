extends CharacterBody2D

const MAX_SPEED: int = 125
const ACCELERATION: int = 1400
const FRICTION: int = 1000

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite
@onready var player_animation: AnimationPlayer = $AnimationPlayer

func _ready():
	# THERE'S BETTER WAY TO HANDLE THIS, CHECK THE COPILOT
	#var tex = load("res://zenney_desert-shooter-pack_1.0/PNG/Weapons/Tiles/tile_0025.png")  # your PNG file
	#Input.set_custom_mouse_cursor(tex)
	pass
	# Load the texture
	var tex_orig: Texture2D = load("res://zenney_desert-shooter-pack_1.0/PNG/Weapons/Tiles/tile_0025.png")
	
	# Get the image data from the texture
	var img: Image = tex_orig.get_image()
	
	# Resize the image (scale ×2 here)
	img.resize(img.get_width() * 2, img.get_height() * 2, Image.INTERPOLATE_NEAREST)
	
	# Create a new texture from the resized image
	var tex_scaled := ImageTexture.create_from_image(img)
	
		# Get the image size
	var w = tex_scaled.get_width()
	var h = tex_scaled.get_height()
	
	# Set hotspot to the middle of the image
	var hotspot = Vector2(w / 2, h / 2)
	
	# Apply as custom cursor
	Input.set_custom_mouse_cursor(tex_scaled, Input.CURSOR_ARROW, hotspot)
	#Input.set_custom_mouse_cursor(tex_scaled)

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
