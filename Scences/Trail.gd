extends Line2D

#how long the trail is 
export var length = 50
var point = Vector2()

func _process(delta):
	# when the trail is too long it just subtracts points from it so it limits the length of the trail frame by frame
	global_position = Vector2(0,0)
	global_rotation = 0
	
	point = get_parent().global_position
	
	add_point(point)
	while get_point_count() > length:
		remove_point(0)
