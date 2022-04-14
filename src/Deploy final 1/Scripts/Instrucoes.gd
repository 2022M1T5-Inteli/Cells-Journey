extends Control

#funcao que da funcionalidade para o botao jogar para mudar para a cena da fase principal
func _on_Jogar_pressed():
	$SomBotaoJogar.play()
	get_tree().change_scene("res://Cenas/Mapa1.tscn")
