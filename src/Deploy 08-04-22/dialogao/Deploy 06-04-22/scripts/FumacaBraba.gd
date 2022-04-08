extends KinematicBody2D
var direcao = Vector2()
var move = Vector2()
var normal = Vector2(0,-1)
var count = 0
var angle = 0

#função que atira a fumaça
func _ready():
	self.position = Vector2(1899,300)
	if ScriptGlobal.PlayerPosition.x > 1870:
		angle = PI/2
	else:
		angle = rand_range(PI/15,PI/2)
	direcao.x = -400*cos(angle)
	direcao.y = 400*sin(angle)

#função que tira dano do player
func _on_Area2D_body_entered(body):
	if body!=self:
		if body.name == "Player":
			ScriptGlobal.life -= 1
		
		self.queue_free()

func _process(delta):
	
	move = direcao

	move_and_slide(move, normal)
	

	
