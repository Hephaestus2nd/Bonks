extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var ImpulsePointY = Vector2(0.0,$CollisionShape2D.shape.extents.y/2)
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		apply_impulse(ImpulsePointY, Vector2(0,-1000))
	
	if Input.is_mouse_button_pressed(BUTTON_RIGHT):
		apply_impulse(ImpulsePointY, Vector2(0,1000))
