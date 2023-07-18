extends RigidBody2D

var boost = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var touch = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _process(delta):
	
	var ImpulsePointY = Vector2(0.0,$CollisionShape2D.shape.radius/2)
	var ImpulsePointX = Vector2($CollisionShape2D.shape.radius/2,0.0)
	if Input.is_action_pressed("up") :
		apply_impulse(ImpulsePointY , Vector2(0,-boost/20))
		boost = boost * 0.97
		$CanvasLayer/Label.text = "Boost Power: " + str(boost)
	if Input.is_action_pressed("down"):
		apply_impulse(ImpulsePointY, Vector2(0,13))
	if Input.is_action_pressed("Left"):
		apply_impulse(ImpulsePointX,Vector2(-7,0))
	if Input.is_action_pressed("right"):
		apply_impulse(ImpulsePointX,Vector2(7,0))



func _on_Player_body_entered(body):
	var speed = get_linear_velocity() 
	print(speed)
	touch = true
	boost = 800
	$CanvasLayer/Label.text = "Boost Power: " + str(boost)	
	print("collision oocccuers with " + body.get_name())
