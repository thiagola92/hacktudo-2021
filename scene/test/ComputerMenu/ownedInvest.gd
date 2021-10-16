extends GridContainer


func _ready():
	for i in range(0, GlobalTest.ownedStock.size()):
		add_line(GlobalTest.ownedStock[i])


func add_line(line):
	var name = Control.new()
	var initial_stock = Label.new()
	var current_stock = Label.new()
	var percentage = Label.new()
	var sell = Button.new()
	
	var name_label = Label.new()
	name_label.text = line['name']
	name.add_child(name_label)
#	label_name.hint_tooltip = 'Ramo: ' + line['ramo']

	initial_stock.text = 'R$' + line['initial_stock']
		
	current_stock.text = 'R$' + line['current_stock']
	if (int(line['current_stock']) > int(line['initial_stock'])):
		current_stock.add_color_override('font_color', Color.greenyellow)
	else:
		current_stock.add_color_override('font_color', Color.red)

	percentage.text = line['percentage']
	if (int(line['percentage']) < 0):
		percentage.add_color_override('font_color', Color.red)
	else:
		percentage.add_color_override('font_color', Color.green)
	percentage.text += '%'

	sell.text = 'Vender'

	add_child(name)
	add_child(initial_stock)
	add_child(current_stock)
	add_child(percentage)
	add_child(sell)
	


func remove_all():
	pass
	
