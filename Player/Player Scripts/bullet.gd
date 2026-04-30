extends Node2D

const SPEED: int = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * SPEED * delta



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_bullet_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("wall"):
		queue_free()
	
	if body.is_in_group("enemy"):
		body.queue_free()
		queue_free()
