extends Area2D

var time = 0

func _ready():
	
	get_node("CollisionShape2D").disabled = true
	get_node("Sprite").visible = false
	
func _process(delta):
	
	if ScriptGlobal.vilaoDied == true:
		
		time+=1
		if time >= 60:
			get_node("CollisionShape2D").disabled = false
			get_node("Sprite").visible = true
			position.x = ScriptGlobal.posicaoVilao.x + 20
	
	
	if ScriptGlobal.tenis == 2:
		get_node("Sprite").visible = false


