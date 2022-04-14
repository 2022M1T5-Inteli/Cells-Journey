extends Area2D

var tempo = 0 #variavel para contagem de tempo

func _ready():#função do godot; roda uma unica vez no inicio
	
	#o colisor e o "sprite" são desativados para o tenis não aparecer no inicio do jogo
	get_node("ColisorTenis").disabled = true
	get_node("ImagemTenis").visible = false
	
func _process(_delta):#função do godot; roda repetitivamente
	
	if ScriptGlobal.vilao_morre == true: #variavel global "vilaoDied" indica que o NPC morreu
		
		tempo += 1#soma 1 a cada frama
		if tempo >= 60:#se "time" for maior que 60, ou seja, depois de 60 frames:
			#liga o colisor e o sprite; faz o tenis aparecer
			get_node("ColisorTenis").disabled = false
			get_node("ImagemTenis").visible = true
			position.x = ScriptGlobal.posicao_vilao.x + 20 #variavel global com valor da posição atual do NPC, faz a posição do tenis ser um pouuinho ao lado da ultima posição do NPC depois que ele morre
	
	
	if ScriptGlobal.tenis == 2: #variavel global vira 2 quando "player" passa pela area do tenis; isso faz com que quando o jogador "pega" o tenis ele desapareça
		get_node("ImagemTenis").visible = false #faz "sprite ficar invisivel





