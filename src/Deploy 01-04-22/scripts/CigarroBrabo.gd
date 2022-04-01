extends Area2D
var time = 0
var direcao_cigarro


func _process(delta):
	if ScriptGlobal.taValendo:
		time+= 1
		if time%20 == 0:
			var chama_fumaca = preload("res://scenes/FumacaBraba.tscn")
			var fumaca = chama_fumaca.instance()
		
			get_parent().add_child(fumaca)
			
	$ProgressBar.value = ScriptGlobal.vidaCigarro



func _on_321Foi_body_entered(body):
	if body.is_in_group("bala"):
		ScriptGlobal.taValendo = true
		get_node("321Foi").queue_free()
