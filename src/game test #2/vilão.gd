extends KinematicBody2D
var vetor = Vector2.ZERO
var up_down = 1

func _physics_process(delta):
	
	
	
	if (self.position.y >= 2100):
		up_down = -1
	if (self.position.y <= 1900):
		up_down = 1
	
	vetor.y = 100*up_down
	move_and_slide(vetor)
	
	print(position)
	

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
