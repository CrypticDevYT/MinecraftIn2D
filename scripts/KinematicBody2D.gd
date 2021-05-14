extends KinematicBody2D


var health = 100
onready var wood = preload("res://wood.tscn")


func damage():
	health = health - 25
	print(health)
	self.hide()
	$Timer.start()
	if health <= 0:
		$Sprite.hide()
		$CollisionShape2D.disabled = true
		var a = wood.instance()
		$Position2D.add_child(a)

func _physics_process(delta):
	if health <= 0:
		$Sprite.hide()
		$CollisionShape2D.disabled = true
		

func del():
	self.queue_free()

func _on_Timer_timeout():
	self.show()
