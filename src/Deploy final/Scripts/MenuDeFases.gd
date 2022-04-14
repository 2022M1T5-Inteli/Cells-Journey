extends Control
func _ready():
	$SomFundo.play()

func _on_Voltar_pressed():
	$SomClick.play()
	get_tree().change_scene("res://Cenas/MenuInicial.tscn")


func _on_Pulmao_pressed():
	$SomClick.play()
	get_tree().change_scene("res://Cenas/Instrucoes.tscn")


func _on_Figado_pressed():
	$SomClick.play()
	get_tree().change_scene("res://Cenas/InfoFasesBloqueadas.tscn")


func _on_ColoDeUtero_pressed():
	$SomClick.play()
	get_tree().change_scene("res://Cenas/InfoFasesBloqueadas.tscn")

func _on_Instestino_pressed():
	$SomClick.play()
	get_tree().change_scene("res://Cenas/InfoFasesBloqueadas.tscn")
