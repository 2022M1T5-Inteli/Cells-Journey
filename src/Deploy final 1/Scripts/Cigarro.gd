extends Area2D
var tempo = 0
var direcao_cigarro
var chama_fumaca = preload("res://Cenas/FumacaDoCigarro.tscn")
var intervalo_tiro = 0

#variavel global booleana que indica que a "BossFigth" ta acontecendo vira verdadira quando abre a cena
func _ready():
	ScriptGlobal.ta_valendo = true


#quando comeca a cena a variavel tempo aumenta continuamente. Quando tempo for multiplo da variavel "intervalo_tiro", a cena "FumacaDoCigarro" e instanciada. "intervalo_tiro" diminui proporcionalmente a "vida_do_cigarro", dessa forma diminuido o intervalo entre os tiros conforme o jogador esta perto de ganhar
func _process(delta):

	_cigarro_morre() 
	
	if ScriptGlobal.ta_valendo:
		tempo += 1
		intervalo_tiro = (ScriptGlobal.vida_do_cigarro/10)+10
		if tempo%intervalo_tiro == 0:
			
			var fumaca = chama_fumaca.instance()
			get_parent().add_child(fumaca)
			$SomTiroBoss.play()
	if ScriptGlobal.vida_do_cigarro == 0:
		ScriptGlobal.ta_valendo = false
		
func _on_VisibilityNotifier2D_screen_entered():
	ScriptGlobal.ta_valendo = true

func _on_VisibilityNotifier2D_screen_exited():
	ScriptGlobal.ta_valendo = false

#reproduz dialogos e cena final do jogo quando a vida do cigarro chega a 0	
func _cigarro_morre():
	if ScriptGlobal.vida_do_cigarro == 0:
		if DialogoGlobal.mata_boss_provocado == false:
			ScriptGlobal.matou_cigarro = true
			DialogoGlobal._criar_dialogo("res://Dialogos/MataBoss.json")
			DialogoGlobal.mata_boss_provocado = true
		else:
			get_tree().change_scene("res://Cenas/VoceGanhou.tscn")
