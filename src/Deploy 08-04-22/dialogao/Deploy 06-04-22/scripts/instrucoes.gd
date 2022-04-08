extends Control

#função que aperta o botão jogar para sair das instruções
func _on_Button_pressed():
	$somClick.play()
	get_tree().change_scene("res://scenes/mapa_1.tscn")
