extends GridContainer


var Text = preload("res://scene/ui/Computer/Stocks/Text.tscn")
var Perc = preload("res://scene/ui/Computer/Stocks/Perc.tscn")
var Risk = preload("res://scene/ui/Computer/Stocks/Risk.tscn")
var Variation = preload("res://scene/ui/Computer/Stocks/Variation.tscn")


func _ready():
	reload()


func reload():
	clear()
	add_Headers()
	
	for stock in Global.ownedStock:
		add_stock(stock)


func clear():
	for child in get_children():
		remove_child(child)


func add_Headers():
	var _name = Text.instance()
	var initial_stock = Text.instance()
	var current_stock = Text.instance()
	var variation = Text.instance()
	var space = Text.instance()
	
	_name.text = "Nome"
	initial_stock.text = "Capital inicial"
	current_stock.text = "Rendimento Ac"
	variation.text = "%"
	
	for item in [_name, initial_stock, current_stock, variation, space]:
		add_child(item)


func add_stock(stock):
	var _name = Text.instance()
	var initial_stock = Text.instance()
	var current_stock = Variation.instance()
	var variation = Perc.instance()
	var sell = Button.new()
	
	_name.set_stock(stock)
	initial_stock.text = "R$%s" % str(stock['initial_stock'])
	current_stock.set_stock(stock)
	variation.set_index(stock['variation'])
	sell.text = "Vender"
	
	for item in [_name, initial_stock, current_stock, variation, sell]:
		add_child(item)
	
