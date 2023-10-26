extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var dot = $Dot


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#establishes connection to global controller
	var global_controller = Globals.get_node("/root/Globals")
	#gettign players global position
	var player_global_position = global_controller.get_player_global_position()
	
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
