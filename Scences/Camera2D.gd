extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#camera movement lerp
var rate = 4
var cutoff = 4


onready var player = get_node("../Player")
onready var map = get_node("../StaticBody2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position = player.position
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
