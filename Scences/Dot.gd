extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var dot = $Dot
onready var player = null # variable to hold teh player instance 

# Called when the node enters the scene tree for the first time.
func _ready():
	#this networking failed
	#establishes connection to global controller
	var global_controller = Globals.get_node("/root/Globals")
	#gettign players global position
	var player_global_position = global_controller.get_player_global_position()
	
	"""
	# Load the player scene as a subscene
	var player_scene = preload("res://Scences/Player.tscn")
	player = player_scene.instance()
	add_child(player)  # Add the player as a child of the minimap scene
	player.connect("player_position_changed", self, "_on_player_position_changed")
	"""
func _process(delta):
	#updating player position with dot position
	var player_global_position = Globals.get_player_global_position()
	dot.position = player_global_position


#func _on_player_position_changed(new_position):
#	dot.position = new_position 

"""

func _process(delta):
	if player:
		print("player position :" , player.position)
		#update the dot's position based on the player position
		
	
"""

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
