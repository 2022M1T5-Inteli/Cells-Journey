extends Control


func _process(delta):
	if Input.is_action_just_pressed("ui_enter"):
		
		get_tree().change_scene("res://scenes/mainScene.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/main menu.tscn")
