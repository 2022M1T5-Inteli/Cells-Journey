extends Node2D

func _ready():
	ScriptGlobal.tunel_nicotina = false
	ScriptGlobal.fase = 2
	$FaseNicotina.play()
