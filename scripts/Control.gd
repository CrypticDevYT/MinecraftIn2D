extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	


func _process(delta):
	if Input.is_action_just_pressed("attack"):
		get_tree().change_scene("res://scenes/afdasdf.tscn")
