tool
extends Polygon2D
# generates new export var which is outline and colour which allows me to add an outline to the polygon
export(Color) var OutLine = Color(1,1,1) setget set_color
func set_color(color):
	#sets the outline to the colour
	OutLine = color
	update()
#generate export var width so i can change width of outline
export(float) var Width = 5.0 setget set_width

func _draw():
	# draws a line for each vertex to adjacents ones
	#ie it just draws an outline
	var poly = get_polygon()
	for i in range(1 , poly.size()):
		draw_line(poly[i-1] , poly[i], OutLine , Width)
	draw_line(poly[poly.size() - 1] , poly[0], OutLine , Width)



func set_width(new_width):
	#sets the new width
	Width = new_width
	update()

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
