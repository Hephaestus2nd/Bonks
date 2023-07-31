extends Node2D

onready var map=preload("res://Scences/Minimap.tscn")
var mm
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_mm()

func set_mm():
	mm=map.instance()
	
	$Player/CanvasLayer.add_child(mm)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
