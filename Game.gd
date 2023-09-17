extends Node2D
onready var game_start_time = OS.get_ticks_msec()


func _process(delta):
	$Stopwatch/Control/Label.text = get_time()

onready var map=preload("res://Scences/HUD.tscn")
var mm
# var a = 2
# var b = "text"

func get_time():
	var current_time = OS.get_ticks_msec() - game_start_time
	var minutes = current_time/1000/60
	var seconds = current_time/1000%60
	var msec = current_time%1000/10
	if minutes < 10:
		minutes = "0" + str(minutes)
	if seconds <10:
		seconds = "0" + str(seconds)
	if msec < 10:
		if msec == 0:
			msec = "00"
		else:
			msec = "0"+str(msec)
	return (str(minutes)+":" + str(seconds)+":"+str(msec))
	print(current_time)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	"""$StartButton.connect("pressed", self, "_on_start_button_pressed")
	$StopButton.connect("pressed", self, "_on_stop_button_pressed")
	$ResetButton.connect("pressed", self, "_on_reset_button_pressed")
	$Timer.connect("timeout", self, "_on_timer_timeout")

	# Start the timer as soon as the scene begins
	_on_start_button_pressed()
"""
#func set_mm():
	#mm=map.instance()
	
	#$Player/CanvasLayer.add_child(mm)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
