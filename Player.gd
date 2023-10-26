extends RigidBody2D
signal win
#initially boost is 0
var boost = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal player_position_changed(position)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#the var A is how much the boost power decreses by. aka damping or something like that
var A = 0.97

var new_position
func _physics_process(delta):
	#updates position
	new_position = global_position
	position = new_position
	#The inverse of delta so delta doesn't affect the game
	var undelta = 60
	#sends global position to global controller
	Globals.set_player_global_position(global_position)

	#  the horizontal and vertical components of the forces are applied to the centre of the circle
	var ImpulsePointY = Vector2(0.0,$CollisionShape2D.shape.radius/2)
	var ImpulsePointX = Vector2($CollisionShape2D.shape.radius/2,0.0)
	#respawns the player if they fall off the map
	if position.y > 26000:
		get_tree().reload_current_scene()
	
	if Input.is_action_pressed("quit"):
		#quits the game
		get_tree().quit()
	if Input.is_action_pressed("restart"):
		#reloads the game and restarts it
		get_tree().reload_current_scene()
	#all inputs are multiplied by delta so they get scaled by frame rate
	#then get multiplied by 60 again via undelta to undo it
	#delta only has an effect if frame rate is not 60 then physics are scaled
	# its already scaled via physics_process but this is just for extra safety
	# applies force in a certain direction when keys are pressed
	if Input.is_action_pressed("up") :
		apply_impulse(ImpulsePointY , Vector2(0,-boost*undelta*delta/20))
		#every single frame
		boost = boost * A
		
		$CanvasLayer/Label.text = "Boost Power: " + str(boost)
	if Input.is_action_pressed("down"):
		apply_impulse(ImpulsePointY, Vector2(0,13*undelta*delta))
	var hori_move = 7
	if Input.is_action_pressed("Left"):
		
		apply_impulse(ImpulsePointX,Vector2(-hori_move*undelta*delta,0))
	if Input.is_action_pressed("right"):
		apply_impulse(ImpulsePointX,Vector2(hori_move*undelta*delta,0))
	 
	
	
func _sync_position(_new_position):
	#updates player position and sends it to minimap
	position = new_position
	emit_signal("player_position_changed" , position)


func _on_player_body_entered(_area):
	#when win body is entered you win
	emit_signal("win")



func _on_Player_body_entered(body):
	# what happens every frame when the player is touching map 
	var speed = get_linear_velocity() 
	
	#refreshes boost power
	boost = 800
	#updates the UI
	$CanvasLayer/Label.text = "Boost Power: " + str(boost)	

	
	
	
