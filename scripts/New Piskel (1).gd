extends Sprite


func _physics_process(delta):
	if Input.is_key_pressed(KEY_P):
		get_tree().paused = false
