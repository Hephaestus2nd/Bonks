extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
#func _ready():
	#$ViewportContainer/Viewport/Player/Camera2D.zoom=Vector2(15,15)
	#$ViewportContainer/Viewport/StaticBody2D/Camera2D.zoom=Vector2(15,15)
	

#onready var dot = $ViewportContainer/Viewport/Dot
var player = null  # Variable to hold the player instance

func _ready():
	# this just displayer the camera and sets the zoom
	$ViewportContainer/Viewport/Minimap/Dot/Camera2D.zoom=Vector2(30,30)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
