tool
extends Node




var player_global_position = Vector2.ZERO

func set_player_global_position(new_position):
	player_global_position = new_position

func get_player_global_position():
	return player_global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
