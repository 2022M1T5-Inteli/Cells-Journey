extends Control

func _on_BotaoVoltar_pressed():
	$SomBotao.play()
	get_tree().change_scene("res://Cenas/MenuInicial.tscn")
