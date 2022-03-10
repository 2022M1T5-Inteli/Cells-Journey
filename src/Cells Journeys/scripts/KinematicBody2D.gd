extends KinematicBody2D

var velocidade = Vector2.ZERO
var countPulo = 0
var normal = Vector2(0,-1)
var run = 1
var life = 6
var collision

func move():
	#andar (movimento horizontal controlado pelo jogador)
	if Input.is_action_pressed("ui_right"):
		velocidade.x = 400*run
		if is_on_floor():
			$Sprite/AnimationPlayer.play("andando")
		else:
			$Sprite/AnimationPlayer.play("RESET")
		get_node("Sprite").set_flip_h(false)
	
	elif Input.is_action_pressed("ui_left"):
		velocidade.x = -400*run
		if is_on_floor():
			$Sprite/AnimationPlayer.play("andando")
		else:
			$Sprite/AnimationPlayer.play("RESET")
		get_node("Sprite").set_flip_h(true)
		
	else:
		velocidade.x = 0
		$Sprite/AnimationPlayer.play("RESET")
		
	if Input.is_action_pressed("ui_shift"):
		run = ScriptGlobal.tenis
	else:
		run = 1
		
func pulo():
	
	if Input.is_action_just_pressed("ui_up") and countPulo < ScriptGlobal.tenis:
		velocidade.y = -400
		countPulo += 1
		
func vida():
	#reconhece contato lateral com o monstrinho e perde vida
	
	
	for i in range(get_slide_count() -1):
		collision = get_slide_collision(i)
		
	if ScriptGlobal.vilaoHit == true or (is_on_wall() and collision.collider.name == "vilao"):
		ScriptGlobal.dano = true
	else:
		ScriptGlobal.dano = false
	
	if ScriptGlobal.dano == true:
		life-=1
		get_node("Sprite").visible = false
	else:
		get_node("Sprite").visible = true
		
	get_node("vida").value = life
	
	if life<=0:
		get_tree().change_scene("res://scenes/game_over.tscn")
	
	print(life)
	
func _physics_process(delta):
	
	velocidade.y += 20
	
	move()
	
	pulo()
	
	move_and_slide(velocidade,normal)
	
	if is_on_floor():
		
		countPulo = 0
		#pergunta pq quando volta p 0 da 3 pulos
		velocidade.y = 0
	
	if is_on_ceiling():
		
		velocidade.y = -10
		
	vida()
	
		
func _on_Area2D_body_entered(body):
	ScriptGlobal.tenis = 2
