extends RigidBody2D
signal win
var boost = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal player_position_changed(position)
var touch = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
var A = 0.97

var new_position
func _physics_process(delta):
	new_position = global_position
	position = new_position
	
	Globals.set_player_global_position(global_position)

	#  the horizontal and vertical components of the forces are applied to the centre of the circle
	var ImpulsePointY = Vector2(0.0,$CollisionShape2D.shape.radius/2)
	var ImpulsePointX = Vector2($CollisionShape2D.shape.radius/2,0.0)
	# applies force in a certain direction when keys are pressed
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_pressed("up") :
		apply_impulse(ImpulsePointY , Vector2(0,-boost*60*delta/20))
		boost = boost * A
		
		$CanvasLayer/Label.text = "Boost Power: " + str(boost)
	if Input.is_action_pressed("down"):
		apply_impulse(ImpulsePointY, Vector2(0,13*60*delta))
	if Input.is_action_pressed("Left"):
		apply_impulse(ImpulsePointX,Vector2(-7*60*delta,0))
	if Input.is_action_pressed("right"):
		apply_impulse(ImpulsePointX,Vector2(7*60*delta,0))
	 # Update player position logic here
	#if network_master:
	#	rpc_unreliable("_sync_position", position)
	
	
func _sync_position(new_position):
	position = new_position
	emit_signal("player_position_changed" , position)


func _on_player_body_entered(area):
	emit_signal("win")



func _on_Player_body_entered(body):
	# what happens every frame when the player is touching map 
	var speed = get_linear_velocity() 
	print(speed)
	touch = true
	boost = 800
	$CanvasLayer/Label.text = "Boost Power: " + str(boost)	
	print("collision oocccuers with " + body.get_name())
	
	
	
