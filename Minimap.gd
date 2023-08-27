extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


<<<<<<< Updated upstream
# Called when the node enters the scene tree for the first time.
func _ready():
	#$ViewportContainer/Viewport/Player/Camera2D.zoom=Vector2(15,15)
	#$ViewportContainer/Viewport/StaticBody2D/Camera2D.zoom=Vector2(15,15)
	pass
=======
onready var dot = $Dot
var player = null  # Variable to hold the player instance
>>>>>>> Stashed changes

func _ready():
	var player_scene = preload("res://Player.tscn")
	player = player_scene.instance()
	add_child(player)  # Add the player as a child of the minimap scene

	# Connect to the remote function
	if player.network_master:
		player.connect("remote_sync_position", self, "_on_remote_sync_position")

func _on_remote_sync_position(new_position):
	dot.position = new_position / 8

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
