extends Node2D
onready var game_start_time = OS.get_ticks_msec()
onready var menu_layer = $WinMenuLayer
const SAVE_FILE_PATH = "user://savedata.save"

func _process(_delta):
	#this updates the stopwatch time
	$Stopwatch/Control/Label.text = get_time()
	

onready var map=preload("res://Scences/HUD.tscn")
var mm
# var a = 2
# var b = "text"

var highscore = 1
var current_time
func get_time():
	
	var A = 10
	#this gets the time in milliseconds by finding the difference between the current time and the os start time
	current_time = OS.get_ticks_msec() - game_start_time
	#this divides the milliseconds into minutes and seconds and milliseconds
	var minutes = current_time/1000/60
	var seconds = current_time/1000%60
	var msec = current_time%1000/10
	#this just detects if the var is a single digit number
	if minutes < A:
		minutes = "0" + str(minutes)
	if seconds < A:
		seconds = "0" + str(seconds)
	if msec < A:
		if msec == 0:
			msec = "00"
		else:
			msec = "0"+str(msec)
		
	#this just returns a string
	return (str(minutes)+":" + str(seconds)+":"+str(msec))
	
# Called when the node enters the scene tree for the first time.
func _ready():
	#immediately loads highscore on startup
	load_highscore()
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

func save_highscore():
	#creates a new file and stores the highscore in it
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(highscore)
	save_data.close()
	
func load_highscore():
	var save_data = File.new()
	#checks if the file exists
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH, File.READ)
		highscore = save_data.get_var()
		save_data.close()
	else:
		#if file doesn't exist then set highscore to very high value so most people can beat
		highscore = -1
	Stats.highscore = highscore
	
func _on_Win_body_entered(_body):
	# In your game script or player script when the race is completed:
	"""print("win")
	var player_time = current_time
	var player_name = "Player 1"  # Replace with the player's name #whats this dude :/

	# Create a dictionary to store the player's time and name
	var player_entry = {
		"name": player_name,
		"time": player_time
	}"""
	#since less time is better score
	#displays current time
	menu_layer._init_win_menu(current_time)
	#resets player position so they can't hit the win screen again
	$Player.position = Vector2()
	#changes highsore if you beat it
	#or if highscore is not set yet i.e is set to -1
	if (current_time != null and current_time < highscore) or highscore == -1:
		
		highscore = current_time
		save_highscore()
