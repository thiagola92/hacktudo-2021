extends Label


func _ready():
	pass


func set_stock(stock):
	text = "R$%s" % str(stock['balance'])
	
	if (stock['current_stock'] >= stock['initial_stock']):
		add_color_override('font_color', Color.green)
	else:
		add_color_override('font_color', Color.red)
