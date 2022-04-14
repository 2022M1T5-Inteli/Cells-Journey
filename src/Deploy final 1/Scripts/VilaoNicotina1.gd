extends KinematicBody2D

var vetor_de_movimento = Vector2.ZERO 
var limite = 1 
var vetor_normal = Vector2(0,-1) 
var tempo = 1 
var parar_vilao = 1 
var vilao_morreu = false
var posicao_atual = Vector2()

func _ready():
	posicao_atual = self.position
	

func _process(_delta):#função do godot; roda repetitivamente
	
	#atribuição de valor ao componente "x" da variavel "vetor"; multiplicado por limite para inverter o sentido e parar_vilao para parar quando nescessario
	vetor_de_movimento.x = 90 *limite*parar_vilao
	
	if (self.position.x >= posicao_atual.x + 180) or (self.position.x <= posicao_atual.x - 180):
		
		limite *= -1#limite é multiplicado por menos 1, dessa forma seu valor será invertido a cada 130 frames
		posicao_atual = self.position
		
	if limite > 0 and vetor_de_movimento.x != 0:#quando limite é positivo, ou seja, igual 1 (movimentação para direita), e o "vetor" no eixo x não é 0, ou seja, NPC está se movimentando, o sprite(imagem do vilão) é espelhado horizontalmente
		$AnimacaoVilaoNicotina.play("Rastejo")
		$AnimacaoVilaoNicotina.set_flip_h(true)
	else: #se não cumprir a condição, ou seja, NPC se movimena para esquerda, sprite volta para seu estado original (virado para esquerda)
		$AnimacaoVilaoNicotina.play("Rastejo")
		$AnimacaoVilaoNicotina.set_flip_h(false)
		#get_node("AnimacaoVilaoNicotina").set_flip_h(false)
		
		
	#função do godot que da movimento ao objeto; ele assume o valor do vetor "vetor", que esta programado a cima, e o "vetor_normal"
	move_and_slide(vetor_de_movimento, vetor_normal)
	
	if is_on_wall():
		self.position.x += limite*10
	
	if is_on_ceiling():#função do godot que reconhece contato com o teto; o vilao só colide com o teto quando o jogador pula em cima dele; abaixo esta programado o vilão morrendo

		vilao_morreu = true #variavel vira verdadeira; isso é usado para programar em outras cenas coisas que acontecem após a morte do NPC
		vetor_de_movimento.y = 1000 #NPC cai
		get_node("ColisorVilaoNicotina").scale = Vector2(1,1)
		scale.y = 0.1
		$SomMorteVilao.play()

		#linhas 41 a 46  fazem parecer que o NPC é esmagado pelo jogador

		parar_vilao = 0 #multiplica o "vetor", faz NPC parar ao morrer


	if vilao_morreu == true: # após vilão morto

		tempo += 1 #soma 1 na variavel a cada frame


		if tempo == 70: #quando "tempo" chega em 70, ou seja, 70 frames após o inicio da contagem; sprite fica invisivel e o colisor é desabilitado
			get_node("AnimacaoVilaoNicotina").visible = false
			get_node("ColisorVilaoNicotina").disabled = true
			
func _on_AreaVilaoSemTenis_body_entered(body):
	if "Bala" in body.name:
		vilao_morreu = true
		queue_free()
