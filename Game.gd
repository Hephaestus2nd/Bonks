extends Node2D
onready var game_start_time = OS.get_ticks_msec()
onready var menu_layer = $WinMenuLayer
const SAVE_FILE_PATH = "user://savedata.save"
func _process(_delta):
	$Stopwatch/Control/Label.text = get_time()

onready var map=preload("res://Scences/HUD.tscn")
var mm
# var a = 2
# var b = "text"

var highscore = 1
var current_time
func get_time():
	current_time = OS.get_ticks_msec() - game_start_time
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
	
# Called when the node enters the scene tree for the first time.
func _ready():
	load_highscore()
	print(highscore)
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
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(highscore)
	save_data.close()
	
func load_highscore():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH, File.READ)
		highscore = save_data.get_var()
		save_data.close()
	else:
		highscore = 1000000
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
	menu_layer._init_win_menu(current_time)
	$Player.position = Vector2()
	if current_time != null and current_time < highscore:
		
		highscore = current_time
		save_highscore()
		
	
	
	
	
	
	

	# Add the player's entry to the high scores list
	#high_scores.append(player_entry)

	
