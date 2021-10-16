extends GridContainer


var Text = preload("res://scene/ui/Computer/Stocks/Text.tscn")
var Perc = preload("res://scene/ui/Computer/Stocks/Perc.tscn")
var Risk = preload("res://scene/ui/Computer/Stocks/Risk.tscn")


func _ready():
	reload()


func reload():
	clear()
	add_Headers()
	
	for stock in Global.newStock:
		add_stock(stock)
	

func clear():
	for child in get_children():
		remove_child(child)


func add_Headers():
	var _name = Text.instance()
	var index = Text.instance()
	var variation = Text.instance()
	var risk = Text.instance()
	var space = Text.instance()
	
	_name.text = "Nome"
	index.text = "%"
	variation.text = "% Acumlado"
	risk.text = "Risco"
	
	for item in [_name, index, variation, risk, space]:
		add_child(item)


func add_stock(stock):
	var _name = Text.instance()
	var index = Perc.instance()
	var variation = Perc.instance()
	var risk = Risk.instance()
	var buy = Button.new()
	
	_name.set_stock(stock)
	index.set_index(stock['index'])
	variation.set_index(stock['variation'])
	risk.set_risk(stock['risk'])
	buy.text = "Comprar"
	
	for item in [_name, index, variation, risk, buy]:
		add_child(item)
	
