tool
extends Polygon2D
export(Color) var OutLine = Color(1,1,1) setget set_color
func set_color(color):
	OutLine = color
	update()

export(float) var Width = 5.0 setget set_width

func _draw():
	var poly = get_polygon()
	for i in range(1 , poly.size()):
		draw_line(poly[i-1] , poly[i], OutLine , Width)
	draw_line(poly[poly.size() - 1] , poly[0], OutLine , Width)



func set_width(new_width):
	Width = new_width
	update()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
