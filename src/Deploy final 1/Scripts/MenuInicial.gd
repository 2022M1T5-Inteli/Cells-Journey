extends Control

func _ready():
	$SomMenu.play()

#funcao que da funcionalidade ao botao "jogar" e muda para a cena seguinte
func _on_Jogar_pressed(): 
	$SomClick.play()
	get_tree().change_scene("res://Cenas/VideoContexto.tscn") 

#funcao que da funcionalidade ao botao "sair" e sai do jogo
func _on_Sair_pressed(): 
	$SomClick.play()
	get_tree().quit() 

#funcao que da funcionalidade ao botao "saiba mais" e abre os creditos do jogo
func _on_SaibaMais_pressed():
	$SomClick.play()
	get_tree().change_scene("res://Cenas/Creditos.tscn") 
