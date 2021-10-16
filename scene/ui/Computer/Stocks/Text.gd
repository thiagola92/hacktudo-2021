extends Label


func _ready():
	pass


func set_stock(stock):
	text = stock['name']
	hint_tooltip = "Ramo: %s" % stock['cluster']
	hint_tooltip += "\nTipo: %s" % stock['type']
