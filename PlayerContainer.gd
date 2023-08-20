extends Node2D

export var player_rigidbody: Player

# Expose the position property of the encapsulated RigidBody2D
var position: Vector2 = Vector2.ZERO setget _set_position

func _set_position(value):
	player_rigidbody.position = value

# Add any additional functionality here
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
