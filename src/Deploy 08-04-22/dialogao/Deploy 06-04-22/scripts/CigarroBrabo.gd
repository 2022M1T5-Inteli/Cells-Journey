extends Area2D
var time = 0
var direcao_cigarro
var chama_fumaca = preload("res://scenes/FumacaBraba.tscn")
var intervalo_tiro = 0

func _ready():
	ScriptGlobal.taValendo = true

	
func _process(delta):  
	if ScriptGlobal.taValendo:
		time += 1
		intervalo_tiro = (ScriptGlobal.vidaCigarro/10)+10
		if time%intervalo_tiro == 0:
			
			var fumaca = chama_fumaca.instance()
		
			get_parent().add_child(fumaca)
	if ScriptGlobal.vidaCigarro == 0:
		ScriptGlobal.taValendo = false

func _on_VisibilityNotifier2D_screen_entered():
	ScriptGlobal.taValendo = true

func _on_VisibilityNotifier2D_screen_exited():
	ScriptGlobal.taValendo = false
	
func _cigarroMorre():
	if ScriptGlobal.vidaCigarro == 0:
		if DialogoGlobal.mataBossTriggered == false:
			DialogoGlobal.create_dialog("res://Dialogs/MataBoss.json")
			DialogoGlobal.mataBossTriggered = true
		else:
			pass
