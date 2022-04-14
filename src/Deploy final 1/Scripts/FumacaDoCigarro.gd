extends KinematicBody2D

var direcao_da_fumaca = Vector2()
var vetor_normal = Vector2(0,-1)
var angulo = 0
var vida_atual

#função que atira a fumaça
func _ready():
	
	print(vida_atual)
	
	self.position = Vector2(1899,300)
	if ScriptGlobal.posicao_do_jogador.x > 1870:
		angulo = PI/2
	else:
		angulo = rand_range(PI/15,PI/2)
		
	direcao_da_fumaca.x = -400*cos(angulo)
	direcao_da_fumaca.y = 400*sin(angulo)

#função que causa dano do player
func _on_AreaFumaca_body_entered(body):
	if body!=self:
		if body.name == "Jogador":
			ScriptGlobal.vida -= 1
			ScriptGlobal.contagem_dano_cigarro += 1
			$SomDanoNoJogador.play()
		
		self.queue_free()

	if ScriptGlobal.vida == 0 and ScriptGlobal.fase == 4:
		if DialogoGlobal.morre_para_boss_provocado == false:
			DialogoGlobal._criar_dialogo("res://Dialogos/MorreParaBoss.json")
			DialogoGlobal.morre_para_boss_provocado = true

		else:
			get_tree().change_scene("res://Cenas/GameOver.tscn")
			
func _process(delta):

	move_and_slide(direcao_da_fumaca, vetor_normal)
	

	#Aguenta ai vitin ja vou
