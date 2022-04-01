extends KinematicBody2D
var direcao = Vector2()
var move = Vector2()
var normal = Vector2(0,-1)
var count = 0
var angle = 0
func _ready():
	self.position = Vector2(1050,300)
	if ScriptGlobal.PlayerPosition.x > 870:
		angle = PI/2
	else:
		angle = rand_range(PI/15,PI/2)
	direcao.x = -400*cos(angle)
	direcao.y = 400*sin(angle)
func _process(delta):
	move = direcao
	
	if is_on_floor() and count == 0:
		direcao.y *= -1.2
		direcao.x *= 1.2
		count += 1
	else:
		direcao.y = direcao.y
	move_and_slide(move,normal)
	
	
	


func _on_Area2D_body_entered(body):
	if body.name != "FumacaBraba" and body!=self:
		self.queue_free()
	elif body.name == "FumacaBraba":
		$CollisionShape2D.disabled = true
	else:
		$CollisionShape2D.disabled = false
