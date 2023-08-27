extends Camera2D


#camera movement lerp that i am not using
var rate = 4
var cutoff = 4


onready var dot = get_node("../Dot")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var dest = dot.global_position
	var x   = lerp(position.x, dest.x, rate * delta)
	var y   = lerp(position.y, dest.y, rate * delta)
	var pos = Vector2(x,y)
	if pos.distance_to(dest) > cutoff:
		position = pos
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
