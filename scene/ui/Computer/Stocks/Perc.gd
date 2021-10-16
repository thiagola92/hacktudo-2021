extends Label


func _ready():
	pass


func set_index(value : float):
	text = "%s%%" % str(value)
	
	if (value >= 0):
		add_color_override('font_color', Color.green)
	else:
		add_color_override('font_color', Color.red)
