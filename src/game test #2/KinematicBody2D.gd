extends KinematicBody2D

var speed = Vector2.ZERO
var count = 0
const normal = Vector2 (0,-1)


func _physics_process(delta):


	speed.y += 20
	
	if Input.is_action_pressed("ui_right"):
		speed.x = 400
		get_node("Sprite").set_flip_h(false)
	elif Input. is_action_pressed("ui_left"):
		speed.x = -400
		get_node("Sprite").set_flip_h(true)
	else:
		speed.x = 0
	
	if Input.is_action_pressed("ui_espaco"):
		speed.y -= 50
	
	if Input. is_action_pressed("ui_down"):
		speed.y += 50
		
	if Input. is_action_just_pressed("ui_up") && count < 2:
		speed.y = -400
		print(speed.y)
		count += 1
		
	move_and_slide(speed, normal)
	
	if is_on_floor():
		print(speed.y)
		count = 0
		speed.y = 0
	
	if is_on_ceiling():
		speed.y = -10
	
	if Input.is_action_pressed("ui_right") && is_on_floor() || Input.is_action_pressed("ui_left") && is_on_floor():
		$Sprite/AnimationPlayer.play("walk")
		
	if position.y < 0:
		speed.y += 50
	
	print(speed.y)
