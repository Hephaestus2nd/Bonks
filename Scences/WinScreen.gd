extends CanvasLayer

onready var score_label = $WinMenu/VBoxContainer/Time
onready var highscore_label = $WinMenu/VBoxContainer/BestTime
onready var win_menu = $WinMenu

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_time(score):
		#this divides the milliseconds into minutes and seconds and milliseconds
	var minutes = score/1000/60
	var seconds = score/1000%60
	var msec = score%1000/10
		#this just detects if the var is a single digit number
	if minutes < 10:
		minutes = "0" + str(minutes)
	if seconds < 10:
		seconds = "0" + str(seconds)
	if msec < 10:
		if msec == 0:
			msec = "00"
		else:
			msec = "0"+str(msec)
	return (str(minutes)+":" + str(seconds)+":"+str(msec))
func _process(_delta):
	 #highscore is set to impossible number when no highscore is stored yet
	if Stats.highscore == -1:
		$WinMenu/VBoxContainer/BestTime.text = "Best Time: No best time recorded"
		
	else:
		# if highscore recorded then display it
		$WinMenu/VBoxContainer/BestTime.text = "Best Time:"+ get_time(Stats.highscore)

func _init_win_menu(score):
	
	score_label.text = "Time:" + get_time(score)
	win_menu.visible = true
	
	
func _on_RestartButton_pressed():
	# if button pressed then the game restarts
	get_tree().reload_current_scene()
	


func _on_QuitButton_pressed():
	#closes the game when quit button is pressed
	get_tree().quit()
