extends CanvasLayer


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
func _process(delta):
	 
	
	$WinMenu/VBoxContainer/BestTime.text = "Best Time:"+ get_highscore()
