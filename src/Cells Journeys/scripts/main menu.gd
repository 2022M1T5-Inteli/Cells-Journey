extends Control

func _on_play_pressed():
	get_tree().change_scene("res://scenes UI/menu fase.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	get_tree().change_scene("res://scenes UI/credits.tscn")
