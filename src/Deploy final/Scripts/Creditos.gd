extends Control

func _ready():
	$SomMenu.play()
	
func _on_Voltar_pressed():#função do godot: envia sinal de botão "back" precionado:
	$SomClick.play()
	get_tree().change_scene("res://Cenas/MenuInicial.tscn")#abre cena do "main menu"
