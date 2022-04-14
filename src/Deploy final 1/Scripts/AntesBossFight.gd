extends Node2D

func _ready():
	ScriptGlobal.tunel_antes_boss_fight = false
	ScriptGlobal.fase = 3
	$SomFaseAntes.play()
