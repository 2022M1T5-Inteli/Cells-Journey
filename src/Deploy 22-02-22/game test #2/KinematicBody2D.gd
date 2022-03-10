extends KinematicBody2D

var speed = Vector2.ZERO
var count = 0
const normal = Vector2 (0,-1)
var run = 1
var life = 3
var collision 
var time = 0
var loosingLife = 0
var tenis = 1




func _physics_process(delta):
#	get_node("CollisionShape2D").disabled = false
	#Gravity:
	speed.y += 20
	
	#Walking
	if Input.is_action_pressed("ui_right"):
		speed.x = 400*run
		get_node("Sprite").set_flip_h(false)
	elif Input. is_action_pressed("ui_left"):
		speed.x = -400*run
		get_node("Sprite").set_flip_h(true)
	else:
		speed.x = 0
	
	#running:
	
	if Input.is_action_pressed("ui_shift") and tenis == 2:
		run = 2
	else:
		run = 1

	#Jumping:
	if Input. is_action_just_pressed("ui_up") && count < tenis || Input. is_action_just_pressed("ui_espaco") && count < 2:
		speed.y = -400
		count += 1
		
	move_and_slide(speed, normal)
	

	if is_on_floor():
		count = 0
		speed.y = 0
	
	if is_on_ceiling():
		speed.y = -10
	
	#animation:
	if Input.is_action_pressed("ui_right") && is_on_floor() || Input.is_action_pressed("ui_left") && is_on_floor():
		$Sprite/AnimationPlayer.play("walk")
	else:
		$Sprite/AnimationPlayer. play("stoped")
	
	
	
	
	for i in range(get_slide_count() -1):
		collision = get_slide_collision(i)
		
		
		if ((collision.collider.name == "minion" )  or \
		   (collision.collider.name == "minion2")) and \
		   is_on_wall()                            and \
			(loosingLife%10 == 0) :
			life-=1
			get_node("Sprite").visible = false
		else:
			get_node("Sprite"). visible = true
			
			
		if (collision.collider.name == "minion" or collision.collider.name == "minion2"):
			loosingLife += 1
			print(loosingLife)
		else:
			loosingLife = 0
	
		
		
		
	if life > 0:
		print(life)
		
	if life == 0:
		print("game over")
		get_tree().change_scene_to(load("res://menu.tscn"))
		
	
	for i in range(get_slide_count() -1):
		collision = get_slide_collision(i)
		if (collision.collider.name == "tenis"):
			tenis = 2
			print("opa")

	print(tenis)

	
#	print(speed.y)
#	print(position.y)
	
		
	
	#voo: se quiser dps
#	if position.y < -10:
#		speed.y += 50
#	if Input.is_action_pressed("ui_espaco"):
#		speed.y -= 50
#
#	if Input. is_action_pressed("ui_down"):
#		speed.y += 50


 # Replace with function body.
