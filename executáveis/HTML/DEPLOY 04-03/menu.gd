extends Node2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_enter"):
		get_tree().change_scene_to(load("res://scene 2.tscn"))
		
		
	


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
