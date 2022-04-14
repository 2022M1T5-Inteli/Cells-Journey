extends Control

var dialogo
var indice_dialogo = 0 
var terminou = false 

func _ready():
	dialogo = DialogoGlobal.dialogo_atual
	print(dialogo)
	hide()
	_carregar_dialogo(dialogo)
	get_tree().paused = true
	
func _process(_delta):
	$"ImagemEnter".visible = terminou
	
	if ScriptGlobal.tenis == 2:
		show()
	
	if ScriptGlobal.entrou_jogo == true:
		show()
	
	if ScriptGlobal.matou_cigarro == true:
		show()
		
	if ScriptGlobal.antes_pegar_arma == true:
		show()
		
	if ScriptGlobal.entra_boss_fight == true:
		show()
		
	if ScriptGlobal.arma == true:
		show()
		
	if ScriptGlobal.antes_nicotina == true:
		show()
	
	
	if Input.is_action_just_pressed("pula_dialogo"): 
		$SomClick.play()
		_carregar_dialogo(dialogo)
	
func _carregar_dialogo(path): # função de carregar dialogo
	var f = File.new()
	f.open(path, File.READ)
	var json = f.get_as_text()
	var output = parse_json(json)
	
	if indice_dialogo < output.size(): # tem que ser menor para não passar a qtd desejada
		terminou = false
		$Texto.bbcode_text = output[indice_dialogo]["Text"] #puxa o nó de richtext.bbcode e iguala ao índice do diálogo
		$Texto.percent_visible = 0 # percentual visível do texto(vai de 0 a 1), para o texto ir andando aos poucos
		$Tween.interpolate_property( # vai interpolar o percentual visível do texto de forma linear de 0 a 1 em 1 segundo
			$Texto, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()

	else:
		queue_free()# se for maior que o tamanho, remove tudo
		get_tree().paused = false
		
	indice_dialogo += 1 #soma um para cada diálogo carregado

func _on_Tween_tween_completed(_object, _key):
	terminou = true




