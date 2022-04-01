extends KinematicBody2D

var speed = 900 #atribui 900 ao valor da velocidade da bala
var direcao_bala = 0 #atribui a direção da bala para relacionar com a direcao do olhar o personagem
var sentido_x = -1 #valor do eixo x que irá ser atribuido no vetor de movimento da bala
var sentido_y = 0 #valor do eixo y que irá ser atribuido no vetor de movimento da bala
var collision
var destroyed  = false
var viloes = ["vilao1","vilao_2","vilao_3","vilao_4","vilao_5"]
var mapa = ["cenario_11","cenario_12"]
	
func pega_direcao(dir): #função que será chamada no script do personagem que servirá para relacionar a direção do olhar do personagem com a direção da bala
	self.direcao_bala = dir #função que atrela as duas direções

func _physics_process(delta):

	#direção que aponta para a direita
	if(direcao_bala == 0):
		$Sprite.flip_h = false
		sentido_x = 1
		sentido_y = 0
		
	#direção que aponta para a esquerda
	elif(direcao_bala == 1):
		$Sprite.flip_h = true
		sentido_x = -1
		sentido_y = 0

	var info = move_and_collide(Vector2(sentido_x, sentido_y)*speed*delta)  #função que faz a munição mover para a direção atrelada anteriormente
		
	if info:
		self.queue_free()
#função que faz com que se a munição saia da tela, ela seja apagada
func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
	$CollisionShape2D.disabled

func _on_Area2D_body_entered(body):
	if body != self:
		for i in viloes:
			if i in body.name:
				print("ooooo")
				body.queue_free()
			if i == "vilao1":
				ScriptGlobal.vilaoDied = true
		for i in mapa:
			if i in body.name:
				self.queue_free()
	if body.name == "Cigas":
#			if ScriptGlobal.taValendo==true:
			ScriptGlobal.vidaCigarro -= 1
			print("pow")
			self.queue_free()
		
			
