extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	#applies force to centre of rectangle
	var ImpulsePointY = Vector2(0.0,$CollisionShape2D.shape.extents.y/2)
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		apply_impulse(ImpulsePointY, Vector2(0,-1000))
	
	if Input.is_mouse_button_pressed(BUTTON_RIGHT):
		apply_impulse(ImpulsePointY, Vector2(0,1000))
