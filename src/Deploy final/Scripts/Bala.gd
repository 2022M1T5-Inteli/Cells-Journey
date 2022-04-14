extends KinematicBody2D

var velocidade_bala = 1500 
var direcao_bala = 0 
var sentido_x = -1 
var sentido_y = 0 
var collision #inutil!!!!
var destruido  = false #inutil!!!!
var viloes_detectados = ["Vilao1","Vilao2","Vilao3","Vilao4","Vilao5","VilaoNicotina1","VilaoNicotina2","VilaoNicotina3","VilaoNicotina4","VilaoNicotina5","VilaoNicotina6"]
var mapas_detectados = ["BossFightMapa","MapaPrincipal"]
	
func _pega_direcao(dir): #função que será chamada no script do personagem que servirá para relacionar a direção do olhar do personagem com a direção da bala
	self.direcao_bala = dir #função que atrela as duas direções

func _physics_process(delta):
	if ScriptGlobal.ta_valendo == true:
		self.scale = Vector2(2,2)
		
	#direção que aponta para a direita
	if(direcao_bala == 0):
		$ImagemBala.flip_h = false
		sentido_x = 1
		sentido_y = 0
		
	#direção que aponta para a esquerda
	elif(direcao_bala == 1):
		$ImagemBala.flip_h = true
		sentido_x = -1
		sentido_y = 0

	var informa_colisao = move_and_collide(Vector2(sentido_x, sentido_y)*velocidade_bala*delta)  #função que faz a munição mover para a direção atrelada anteriormente
		
#função que faz com que se a munição saia da tela, ela seja apagada
func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
	$ColisorBala.disabled

#função que mata as fumaças e diminui a vida do chefao
func _on_AreaBala_body_entered(body):
	if body != self:
			for i in viloes_detectados:
				if i in body.name:
					body.queue_free()
				if i == "Vilao1":
					ScriptGlobal.vilao_morre = true
				
#			for i in viloes_detectados:
#				if i in body.name:
#					self.queue_free()
			if body.name == "Cigarro":
				if ScriptGlobal.ta_valendo==true:
					ScriptGlobal.vida_do_cigarro -= 1
				self.queue_free()
				
			if ScriptGlobal.fase != 2:
				
				self.queue_free()
			else:
				self.queue_free()
