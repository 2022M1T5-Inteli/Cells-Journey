extends Node
var inicioJogoTriggered = false
var pegouTenisTriggered = false
var antesArmaTriggered = false
var morreSmokTriggered = false
var entraBossFightTriggered = false
var mataBossTriggered = false
var morreParaBossTriggered = false

var dialogoAtual

#função que cria dialogo
func create_dialog(path):
	DialogoGlobal.dialogoAtual = path
	var createDialog = load("res://scenes/dialog.tscn") 
	var CreateDialog = createDialog.instance()
	var world = get_tree().current_scene
	world.add_child(CreateDialog)
	
