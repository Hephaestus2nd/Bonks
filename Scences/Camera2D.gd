extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#camera movement lerp

onready var player = get_node("../Player")
#onready var map = get_node("../StaticBody2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	#Camera follows the player
	position = player.position
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
