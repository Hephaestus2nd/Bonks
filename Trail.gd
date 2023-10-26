extends Line2D

#how long the trail is 
export var length = 50
var point = Vector2()

func _physics_process(_delta):
	#initially global position is 0
	global_position = Vector2(0,0)
	#rotation is also 0
	global_rotation = 0
	#sets trail position to player 
	point = get_parent().global_position
	
	add_point(point)
	while get_point_count() > length:
	# when the trail is too long it just subtracts points from it so it limits the length of the trail frame by frame

		remove_point(0)
