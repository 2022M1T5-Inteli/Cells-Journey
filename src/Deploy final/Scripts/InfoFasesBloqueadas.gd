extends Control

func _ready():
	$SomFundo.play()

func _on_BotaoVoltar_pressed():
	$SomClick.play()
	get_tree().change_scene("res://Cenas/MenuDeFases.tscn")
