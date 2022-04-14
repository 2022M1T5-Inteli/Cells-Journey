extends VideoPlayer

func _process(Delta):
	if Input.is_action_pressed("ui_enter"):
		get_tree().change_scene("res://Cenas/MenuDeFases.tscn")


func _on_VideoContexto_finished():
	get_tree().change_scene("res://Cenas/MenuDeFases.tscn")
