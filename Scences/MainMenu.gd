extends Control
const SAVE_FILE_PATH = "user://savedata.save"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var highscore

# Called when the node enters the scene tree for the first time.
func _ready():
	var save_data = File.new()
	#checks if the file exists
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH, File.READ)
		# gets the data then closes the file
		highscore = save_data.get_var()
		save_data.close()
	else:
		#if file doesn't exist then set highscore to impossible value
		highscore = -1
	Stats.highscore = highscore
	if Stats.highscore == -1:
		#no best time recorded so none displayed
		$Panel/BestTime.text = "Best Time: No best time recorded"
	else:
		#displays the time
		$Panel/BestTime.text = "Best Time:"+ get_time(Stats.highscore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("quit"):
		#quits the game
		get_tree().quit()
		#	pass
func get_time(score):
		#this divides the milliseconds into minutes and seconds and milliseconds
	var A = 10
	#converts pure milliseconds into minutes and seconds while leaving some leftovers
	var minutes = score/1000/60
	var seconds = score/1000%60
	var msec = score%1000/10
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
	return (str(minutes)+":" + str(seconds)+":"+str(msec))

func _on_PlayButton_pressed():
	#changes scene once button is pressed
	get_tree().change_scene("res://Scences/Game.tscn")


func _on_HowtoPlay_pressed():
	get_tree().change_scene("res://Scences/How_to_Play.tscn")


func _on_quit_pressed():
	get_tree().quit()
