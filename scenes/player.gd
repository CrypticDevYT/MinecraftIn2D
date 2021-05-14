extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = -1800
export (int) var gravity = 4000
var playing = "right"
var velocity = Vector2.ZERO
var wood = 1

func get_input():
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("walk_right"):
		velocity.x += speed
	if Input.is_action_pressed("walk_left"):
		velocity.x -= speed
	if Input.is_action_pressed("walk_up"):
		velocity.y -= speed
	if Input.is_action_pressed("walk_down"):
		velocity.y += speed
		

func _physics_process(delta):
	if Input.is_action_just_pressed("walk_left"):
		$AnimationPlayer.play("walk_left")
		$"attack collision".scale.x = -1
	if Input.is_action_just_pressed("walk_right"):
		$AnimationPlayer.play("walk_right")
		$"attack collision".scale.x = 1
	if Input.is_action_just_pressed("walk_up"):
		$AnimationPlayer.play("walk_up")
	if Input.is_action_just_pressed("walk_down"):
		$AnimationPlayer.play("walk_down")
	elif Input.is_action_just_released("walk_left"):
		$AnimationPlayer.play("idle_left")
		playing = "left"
	elif Input.is_action_just_released("walk_right"):
		$AnimationPlayer.play("idle_right")
		playing = "right"
	elif Input.is_action_just_released("walk_up"):
		$AnimationPlayer.play("idleup")
	elif Input.is_action_just_released("walk_down"):
		$AnimationPlayer.play("IdleDown")

	if Input.is_action_just_pressed("attack") && playing == "left":
		$AnimationPlayer.play("hit_left")
	elif Input.is_action_just_pressed("attack") && playing == "right":
		$AnimationPlayer.play("hit_right")
	get_input()
	$"Camera2D/Control/New Piskel-1png (1)/Label".set_text(str(wood))
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
		
func pickup():
	wood = wood + 1
	print(wood)

func _on_Area2D_body_entered(body):
	if body.is_in_group("tree"):
		body.damage()
