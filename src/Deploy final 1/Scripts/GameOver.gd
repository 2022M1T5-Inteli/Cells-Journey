extends Control

func _ready():
	
	#retorna variaveis globais para estado original
	ScriptGlobal.vilao_morre = false
	ScriptGlobal.ataque_do_vilao_sem_tenis = false
	ScriptGlobal.vida = 6
	ScriptGlobal.contagem_dano_esmoque = 0
	ScriptGlobal.contagem_dano_cigarro = 0
	
func _process(_delta):
	#reconhece entrada "enter" e abre a cena da fase de novo
	if Input.is_action_just_pressed("ui_enter"):
		if ScriptGlobal.fase == 1:
			$SomClick.play()
			get_tree().change_scene("res://Cenas/Mapa1.tscn")
		elif ScriptGlobal.fase == 2:
			$SomClick.play()
			get_tree().change_scene("res://Cenas/FaseNicotina.tscn")
		elif ScriptGlobal.fase == 3:
			$SomClick.play()
			get_tree().change_scene("res://Cenas/AntesBossFight.tscn")
		elif ScriptGlobal.fase == 4:
			$SomClick.play()
			get_tree().change_scene("res://Cenas/BossFight.tscn")

func _on_VoltarAoMenu_pressed():#função do godot: envia sinal de botão "Button" precionado:
	$SomClick.play()
	get_tree().change_scene("res://Cenas/MenuInicial.tscn")#abre cena da fase de novo
