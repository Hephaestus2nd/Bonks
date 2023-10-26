extends Node2D


onready var dot    = $Dot
onready var player = get_node("/root/Playground/Player")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#Sets the dot position to player position
	dot.position = player.position
#	pass
