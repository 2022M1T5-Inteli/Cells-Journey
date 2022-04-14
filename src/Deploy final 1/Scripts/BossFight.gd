extends Node2D

#
func _ready():
	ScriptGlobal.fase = 4
	ScriptGlobal.vida_do_cigarro = 200
	ScriptGlobal.contagem_dano_cigarro = 0
	$SomBossFight.play()
