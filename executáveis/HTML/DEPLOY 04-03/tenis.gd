extends KinematicBody2D
var normal = Vector2 (0,-1)
#func _physics_process(delta):

func _physics_process(delta):
	
	move_and_slide(normal)
	
	if is_on_wall() or is_on_ceiling():
		get_node("Sprite").visible = false
		get_node("CollisionShape2D").disabled = true
