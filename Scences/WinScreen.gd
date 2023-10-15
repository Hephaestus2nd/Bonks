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
func get_highscore():
	var minutes = Stats.highscore/1000/60
	var seconds = Stats.highscore/1000%60
	var msec = Stats.highscore%1000/10
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
func _process(_delta):
	 
	
	$WinMenu/VBoxContainer/BestTime.text = "Best Time:"+ get_highscore()

func _init_win_menu(score):
	var minutes = score/1000/60
	var seconds = score/1000%60
	var msec = score%1000/10
	if minutes < 10:
		minutes = "0" + str(minutes)
	if seconds <10:
		seconds = "0" + str(seconds)
	if msec < 10:
		if msec == 0:
			msec = "00"
		else:
			msec = "0"+str(msec)
	score_label.text = "Time:" + str(minutes)+":" + str(seconds)+":"+str(msec)
	win_menu.visible = true
	
	
func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	


func _on_QuitButton_pressed():
	get_tree().quit()
