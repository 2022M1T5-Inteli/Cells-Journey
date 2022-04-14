extends CanvasLayer

func _ready():
	set_visible(false) # deixa a interface invisível se nada for pressionado
	#OS.window_fullscreen = true

#funcao que define a interface como visivel ou nao e pausa a cena qunado escape for pressionado
func _input(event): 
	if event.is_action_pressed("pause"): 
		set_visible(true) 
		get_tree().paused = true 

#funcao para visualizar a interface dos nos 
func set_visible(is_visible): 
	for node in get_children(): 
		node.visible = is_visible 

#funcao que da funcionalidade ao botao "resume"(despausa e deixa interface invisivel)
func _on_BotaoVoltar_pressed():
	get_tree().paused = false 
	set_visible(false) 

#funcao que da funcionalidade que ao botão "voltar para o menu"(jogo despausa, muda para cena inicial e interface invisivel)
func _on_BotaoIrParaOMenu_pressed():
	get_tree().paused = false 
	get_tree().change_scene("res://Cenas/MenuInicial.tscn") 
	set_visible(false) 
