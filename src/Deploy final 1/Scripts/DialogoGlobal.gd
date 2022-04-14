extends Node
var inicio_jogo_provocado = false
var pegou_tenis_provocado = false
var antes_arma_provocado = false
var morre_esmoque_provocado = false
var entra_boss_fight_provocado = false
var mata_boss_provocado = false
var morre_para_boss_provocado = false
var pegou_arma_provocado = false
var antes_nicotina_provocado = false

var dialogo_atual

#funcao que cria dialogo
func _criar_dialogo(path):
	DialogoGlobal.dialogo_atual = path
	var pega_dialogo = load("res://Cenas/Dialogos.tscn") 
	var instancia_dialogo = pega_dialogo.instance()
	var world = get_tree().current_scene
	world.add_child(instancia_dialogo)
	
