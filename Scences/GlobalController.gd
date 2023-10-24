tool
extends Node



#store the player global position
var player_global_position = Vector2.ZERO

func set_player_global_position(new_position):
	#updates the players global position
	player_global_position = new_position

func get_player_global_position():
	#it just returns the playesr global position to whatever that calls it
	return player_global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
