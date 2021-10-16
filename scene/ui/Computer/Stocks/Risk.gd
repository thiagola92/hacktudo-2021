extends Label


var base_text = "R$%s"


func _ready():
	pass


func set_risk(value : int):
	text = "%s%%" % str(value)
	
	if (value < 26):
		add_color_override('font_color', Color.green)
		hint_tooltip = 'Baixo'
	elif (value < 51):
		add_color_override('font_color', Color.yellow)
		hint_tooltip = 'Médio'
	elif (value < 76):
		add_color_override('font_color', Color.orange)
		hint_tooltip = 'Alto'
	else:
		add_color_override('font_color', Color.red)
		hint_tooltip = 'Muito Alto'
