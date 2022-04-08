extends Control

var dialogo
var dialog_index = 0 
var finished = false 

func _ready():
	dialogo = DialogoGlobal.dialogoAtual
	print(dialogo)
	hide()
	load_dialog(dialogo)
	get_tree().paused = true
	
func _process(_delta):
	if ScriptGlobal.tenis == 2:
		show()
		
	$"setinha".visible = finished
	#$"Rogerchammas".visible = finished
	
	if ScriptGlobal.entrouJogo == true:
		show()
	
	if Input.is_action_just_pressed("ui_accept"): 
		$somClick.play()
		load_dialog(dialogo)
	
func load_dialog(path): # função de carregar dialogo
	var f = File.new()
	f.open(path, File.READ)
	var json = f.get_as_text()
	var output = parse_json(json)
	
	if dialog_index < output.size(): # tem que ser menor para não passar a qtd desejada
		finished = false
		$RichTextLabel.bbcode_text = output[dialog_index]["Text"] #puxa o nó de richtext.bbcode e iguala ao índice do diálogo
		$RichTextLabel.percent_visible = 0 # percentual visível do texto(vai de 0 a 1), para o texto ir andando aos poucos
		$Tween.interpolate_property( # vai interpolar o percentual visível do texto de forma linear de 0 a 1 em 1 segundo
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		#print("roger lindo")
	else:
		queue_free()# se for maior que o tamanho, remove tudo
		get_tree().paused = false
		
	dialog_index += 1 #soma um para cada diálogo carregado

func _on_Tween_tween_completed(_object, _key):
	finished = true




