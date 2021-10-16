extends GridContainer


var Text = preload("res://scene/ui/Computer/Stocks/Text.tscn")
var Perc = preload("res://scene/ui/Computer/Stocks/Perc.tscn")
var Risk = preload("res://scene/ui/Computer/Stocks/Risk.tscn")
var Variation = preload("res://scene/ui/Computer/Stocks/Variation.tscn")
var Sell = preload("res://scene/ui/Computer/Stocks/Sell.tscn")


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
	var balance = Text.instance()
	var variation = Text.instance()
	var space = Text.instance()
	
	_name.text = "Nome"
	initial_stock.text = "Capital inicial"
	balance.text = "Rendimento Ac"
	variation.text = "%"
	
	for item in [_name, initial_stock, balance, variation, space]:
		add_child(item)


func add_stock(stock):
	var _name = Text.instance()
	var initial_stock = Text.instance()
	var balance = Variation.instance()
	var variation = Perc.instance()
	var sell = Sell.instance()
	
	_name.set_stock(stock)
	initial_stock.text = "R$%s" % str(stock['initial_stock'])
	balance.set_stock(stock)
	variation.set_index(stock['variation'])
	sell.connect("on_sell", self, "reload")
	
	for item in [_name, initial_stock, balance, variation, sell]:
		add_child(item)
	
