extends KinematicBody2D 

var velocidade = Vector2.ZERO 
var contagem_pulo = 0 
var vetor_normal = Vector2(0,-1)
var correr = 1 
var direcao_jogador = 0 
var parado = 1 
var viloes = ["Vilao1","Vilao2","Vilao3","Vilao4","Vilao5","VilaoNicotina1"]

#Determina o movimento de andar do jogador
#Nela esta determinado que ao clicar as setas da direita ou tecla D o jogador se move com animação para a direita,
#caso a seta da esquerda ou tecla A sejam clicadas o jogador se move com animação para a esquerda
#No momento em que o jogador pegar o tenis a variavel correr recebe o valor 2 que multiplica a velocidade do jogador
func _andar():
	ScriptGlobal.posicao_do_jogador = self.position
		
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_d"):
		direcao_jogador = 0 
		velocidade.x = 400*correr
		get_node("ImagemJogador").set_flip_h(false)
				
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_a"):
		velocidade.x = -400*correr
		direcao_jogador = 1
		get_node("ImagemJogador").set_flip_h(true)
#
	else:
		velocidade.x = 0
	
	if Input.is_action_pressed("ui_shift"):
		correr = ScriptGlobal.tenis
	else:
		correr = 1

#Função que faz o jogador pular
#Nela esta descrito que ao apertar a seta para cima ou a tecla W, o jogador irá pular num limite determinado pela variavel
#"contagem_pulo", a qual é aumentada quando o Jogador pega o tenis ao longo do jogo		
func _pular():
	if (Input.is_action_just_pressed("ui_up") and contagem_pulo < ScriptGlobal.tenis) or (Input.is_action_just_pressed("ui_w") and contagem_pulo < ScriptGlobal.tenis):
		$SomPulo.play()
		velocidade.y = -1000
		contagem_pulo += 1
		
#função que determina a vida do personagem, está atrelada à Barra de Vida presa no topo da tela
#Caso a vida do personagem chegue à zero em diferentes ocasiões, alguns diálogos são liberados
func _vida():
	get_node("BarraDeVidaDoJogador").get_child(0).value = ScriptGlobal.vida
	

	if ScriptGlobal.vida <= 0:
		DialogoGlobal.inicio_jogo_provocado = false
		DialogoGlobal.pegou_tenis_provocado = false
		DialogoGlobal.antes_arma_provocado = false
		DialogoGlobal.morre_esmoque_provocado = false
		DialogoGlobal.entra_boss_fight_provocado = false
		DialogoGlobal.mata_boss_provocado = false
		DialogoGlobal.morre_para_boss_provocado = false
		DialogoGlobal.antes_nicotina_provocado = false
		get_tree().change_scene("res://Cenas/GameOver.tscn")

	if velocidade.y > 2000:
		DialogoGlobal.inicio_jogo_provocado = false
		DialogoGlobal.pegou_tenis_provocado = false
		DialogoGlobal.antes_arma_provocado = false
		DialogoGlobal.morre_esmoque_provocado = false
		DialogoGlobal.entra_boss_fight_provocado = false
		DialogoGlobal.mata_boss_provocado = false
		DialogoGlobal.morre_para_boss_provocado = false
		DialogoGlobal.antes_nicotina_provocado = false
		get_tree().change_scene("res://Cenas/GameOver.tscn")

#função que determina todo o tiro do personagem. 
#ao apertar a barra de espaço a cena "Bala" é instanciada e com isso a posição da bala é atrelada à posição do jogador
func _atirar():
	if Input.is_action_just_pressed("ui_shoot"):
		ScriptGlobal.atirando = true
		$ImagemJogador.play("CorrendoAtirandoTenis")
		$SomTiro.play()
		var chama_a_bala = preload("res://Cenas/Bala.tscn")
		var bala = chama_a_bala.instance()
		
		bala._pega_direcao(direcao_jogador)
		
		if direcao_jogador == 0:
			bala.position.x = self.position.x + 35
			bala.position.y = self.position.y - 20
			
		else:
			bala.position.x = self.position.x - 120
			bala.position.y = self.position.y - 20
			
		get_parent().add_child(bala)
	else:
		ScriptGlobal.atirando = false

#Função que determina que ao entrar em um tunel, o jogador irá mudar de cena
#As variaveis globais "tunel_nicotina" e "tunel_antes_boss" recebem o valor true quando o jogador sobe em cima do tunel, liberando
#assim, que o jogador possa clicar a seta para baixo ou a tecla S para entrar no tunel
func _entrar_tunel():
	if ScriptGlobal.tunel_nicotina:
		if Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_s"):
			get_tree().change_scene("res://Cenas/FaseNicotina.tscn")
			ScriptGlobal.fase = 2
			
	if ScriptGlobal.tunel_antes_boss_fight:
		if Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_s"):
			get_tree().change_scene("res://Cenas/AntesBossFight.tscn")
			ScriptGlobal.fase = 3
			
func _animacao():
	if ScriptGlobal.tenis == 1:
		if velocidade.x == 0:
			if ScriptGlobal.atirando == false:
				if is_on_floor():
					$ImagemJogador.play("Parado")
				else:
					$ImagemJogador.play("Pulando")
			else:
				if is_on_floor():
					$ImagemJogador.play("ParadoAtirando")
				else:
					$ImagemJogador.play("PulandoAtirando")
		if velocidade.x != 0:
			if ScriptGlobal.atirando == false:
				if is_on_floor():
					$ImagemJogador.play("Correndo")
				else:
					$ImagemJogador.play("Pulando")
			else:
				if is_on_floor():
					$ImagemJogador.play("CorrendoAtirando")
				else:
					$ImagemJogador.play("PulandoAtirando")
	if ScriptGlobal.tenis == 2:
		if velocidade.x == 0:
			if ScriptGlobal.atirando == false:
				if is_on_floor():
					$ImagemJogador.play("ParadoTenis")
				else:
					$ImagemJogador.play("PulandoTenis")
			else:
				if is_on_floor():
					$ImagemJogador.play("ParadoAtirandoTenis")
				else:
					$ImagemJogador.play("PulandoAtirandoTenis")
		if velocidade.x != 0:
			if ScriptGlobal.atirando == false:
				if is_on_floor():
					$ImagemJogador.play("CorrendoTenis")
				else:
					$ImagemJogador.play("PulandoTenis")
			else:
				if is_on_floor():
					$ImagemJogador.play("CorrendoAtirandoTenis")
				else:
					$ImagemJogador.play("PulandoAtirandoTenis")

func _physics_process(_delta):

	#Gravidade: aceleração constante para baixo:
	velocidade.y += 40

	#Condição que determina que a função "_atirar" só será chamada caso o Jogador pegue o item da arma ao longo do jogo
	if ScriptGlobal.arma:
		_atirar()
	
	_andar()
	
	_animacao()
	
	_pular()
	
	#Função que permite o personagem se mover
	move_and_slide(velocidade, vetor_normal)
	
	#Determina que ao encostar no chão o jogador resete a "contagem_pulo" para que ele possa pular novamente
	if is_on_floor():
		contagem_pulo = 0
		velocidade.y = 0
	
	#Determina que ao bater a cabeça ele "quica"
	if is_on_ceiling():
		velocidade.y = -10
		
	_vida()
	
	_entrar_tunel()
	
#Função que determina quando o tenis é pego
func _on_Area2D_body_entered(_body):
	#roda dialogo tenis
	if DialogoGlobal.pegou_tenis_provocado == false:
		DialogoGlobal._criar_dialogo("res://Dialogos/pegouTenis.json")
		DialogoGlobal.pegou_tenis_provocado = true
	else:
		pass
		
	if _body == self:
		ScriptGlobal.tenis = 2 #variavel global "tenis" assume valor 2 para habilitar corrida e pulo duplo

#função quando pega a arma
func _on_Arma_body_entered(body):
	if DialogoGlobal.pegou_arma_provocado == false:
		DialogoGlobal._criar_dialogo("res://Dialogos/PegouArma.json")
		DialogoGlobal.pegou_arma_provocado = true
	else:
		pass
	
	if body == self:
		ScriptGlobal.arma = true

#função do colisor que volta para o menu
func _on_VoltaMenu_body_entered(_body):
	if _body == self:
		get_tree().change_scene("res://Cenas/MenuDeFases.tscn")

#função do colisor que detecta dano causado ao personagem
func _on_AreaJogador_body_entered(body):
	if body != self:
		for i in viloes:
			if i in body.name:
				ScriptGlobal.vida -= 1
				ScriptGlobal.contagem_dano_esmoque += 1
				$SomDano.play()
				
	if body != self:
		if body.name == "Cigarro":
			ScriptGlobal.vida -= 1
			ScriptGlobal.contagem_dano_cigarro += 1
			$SomDano.play()
				
	if ScriptGlobal.contagem_dano_esmoque == 6:
		if DialogoGlobal.morre_esmoque_provocado == false:
			DialogoGlobal._criar_dialogo("res://Dialogos/MorreSmok.json")
			DialogoGlobal.morre_esmoque_provocado = true
		else:
			get_tree().change_scene("res://Cenas/GameOver.tscn")

	if ScriptGlobal.vida == 0 and ScriptGlobal.fase == 4:
		if DialogoGlobal.morre_para_boss_provocado == false:
			DialogoGlobal._criar_dialogo("res://Dialogos/MorreParaBoss.json")
			DialogoGlobal.morre_para_boss_provocado = true

		else:
			get_tree().change_scene("res://Cenas/GameOver.tscn")

#função do colisor que leva para a boss fight
func _on_TpBossFight_body_entered(body):
	if body == self:
		get_tree().change_scene("res://Cenas/BossFight.tscn")
		ScriptGlobal.fase = 4

#função que roda o primeiro dialogo
func _on_EntrouFase_body_entered(body):
	if DialogoGlobal.inicio_jogo_provocado == false:
		DialogoGlobal._criar_dialogo("res://Dialogos/Entrada.json")
		DialogoGlobal.inicio_jogo_provocado = true
	else:
		pass
	
	if body == self:
		ScriptGlobal.entrou_jogo = true

#
func _on_AntesArma_body_entered(body):
	if DialogoGlobal.antes_arma_provocado == false:
		DialogoGlobal._criar_dialogo("res://Dialogos/AntesArma.json")
		DialogoGlobal.antes_arma_provocado = true
	else:
		pass
	
	if body == self:
		ScriptGlobal.antes_pegar_arma = true

#
func _on_DialogoEntrada_body_entered(body):
	if DialogoGlobal.entra_boss_fight_provocado == false:
		DialogoGlobal._criar_dialogo("res://Dialogos/EntraBossFight.json")
		DialogoGlobal.entra_boss_fight_provocado = true
	else:
		pass
	
	if body == self:
		ScriptGlobal.entra_boss_fight = true


func _on_AreaFaseNicotina_body_entered(body):
	get_tree().change_scene("res://Cenas/GameOver.tscn")


func _on_AreaTunelNicotina_body_entered(body):
	if body == self:
		ScriptGlobal.tunel_nicotina = true


func _on_AreaTunelAntesBossFight_body_entered(body):
	if body == self:
		ScriptGlobal.tunel_antes_boss_fight = true


func _on_AntesNicotina_body_entered(body):
	if DialogoGlobal.antes_nicotina_provocado == false:
		DialogoGlobal._criar_dialogo("res://Dialogos/AntesNicotina.json")
		DialogoGlobal.antes_nicotina_provocado = true
	else:
		pass
	
	if body == self:
		ScriptGlobal.antes_nicotina = true
