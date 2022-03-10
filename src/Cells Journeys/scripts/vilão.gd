 extends KinematicBody2D

var vetor = Vector2.ZERO
var limite = 1
var normal = Vector2(0,-1)
var time_1 = 1
var stop = 1
var time = 0
var time_3 = 0
var recharge = false
# vilão andar na plataforma

func _process(delta):
	vetor.x = 90*limite*stop
	
	time += 1
	
	#vilão vira de um lado para o outro na plataforma
	
	if (time%130)==0:
		limite = limite*-1
	
	if limite > 0 and vetor.x != 0:
		get_node("Sprite").set_flip_h(true)
	else:
		get_node("Sprite").set_flip_h(false)
		
	move_and_slide(vetor, normal)
	
	# jogador mata o vilão pulando em cima
	
	if is_on_ceiling():
		
		ScriptGlobal.vilaoDied = true
		vetor.y = 1000
		
		get_node("CollisionShape2D").scale = Vector2(1,1)
		scale.y = 0.1
		
		stop = 0
		
		# após vilão morto
		
	if ScriptGlobal.vilaoDied == true:
		
		time_1+=1
		
		
		if time_1 == 70:
			get_node("Sprite").visible = false
			get_node("CollisionShape2D").disabled = true
		
	
	ScriptGlobal.posicaoVilao = self.position
	
	if is_on_wall():
		ScriptGlobal.vilaoHit = true
	else:
		ScriptGlobal.vilaoHit = false
		
	if ScriptGlobal.dano == true:
		
		get_node("CollisionShape2D").disabled = true
		recharge = true
	
	if recharge == true:
		
		time_3+=1
		
	if (time_3%50)==0 and ScriptGlobal.vilaoDied == false:
		
		get_node("CollisionShape2D").disabled = false
		ScriptGlobal.dano == false
		recharge = false
	

		
	
