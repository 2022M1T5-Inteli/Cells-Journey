extends Node2D

func _ready():
	
	$SomFundo.play()
	ScriptGlobal.tenis = 1
	ScriptGlobal.vilao_morre = false 
	ScriptGlobal.posicao_vilao = Vector2() 
	ScriptGlobal.dano = false 
	ScriptGlobal.ataque_do_vilao = false  
	ScriptGlobal.vilao_sem_tenis_morre = false
	ScriptGlobal.ataque_do_vilao_sem_tenis = false
	ScriptGlobal.vida = 6 
	ScriptGlobal.arma = false
	$Bala.queue_free()
	ScriptGlobal.fase = 1
	ScriptGlobal.contagem_dano_esmoque = 0
	ScriptGlobal.tunel_nicotina = false
	

func _process(delta):
	if ScriptGlobal.matou == true:
		$Vilao1.queue_free
		ScriptGlobal.vida += 1

