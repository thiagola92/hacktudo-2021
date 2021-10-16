extends Button


signal on_buy()


var position
var stock


func _ready():
	var ok_button = $ConfirmationDialog.get_ok()
	
	ok_button.connect("button_down", self, "_on_ConfirmationDialog_ok_pressed")


func _on_Buy_pressed():
	position = get_meta("position")
	stock = Global.newStock[position]
	
	$ConfirmationDialog/CenterContainer/HSlider.max_value = Global.money
	$ConfirmationDialog.popup_centered()


func _on_ConfirmationDialog_ok_pressed():
	var initial_stock = $ConfirmationDialog/CenterContainer/HSlider.value
	
	if initial_stock == 0:
		return
	
	for pos in range(0, Global.ownedStock.size()):
		var s = Global.ownedStock[pos]
		
		if s['name'] == stock['name']:
			return increase_initial_stock(initial_stock, pos)
			
	add_new_initial_stock(initial_stock)

func increase_initial_stock(initial_stock, pos):
	var s = Global.ownedStock[pos]
	
	s['initial_stock'] += initial_stock
	s['current_stock'] += initial_stock
	s['balance'] += initial_stock
	s['variation'] = Global.calc_variation(s['initial_stock'], s['current_stock'])
	
	Global.ownedStock[pos] = s
	Global.money -= initial_stock
	
	emit_signal("on_buy")

func add_new_initial_stock(initial_stock):
	Global.ownedStock.append({
		'name': stock['name'],
		'initial_stock': initial_stock,
		'current_stock': initial_stock,
		'balance': initial_stock,
		'variation': 0,
		'cluster': stock['cluster'],
		'type': stock['type']
	})
	
	Global.money -= initial_stock
	
	emit_signal("on_buy")


func _on_HSlider_value_changed(value):
	$ConfirmationDialog/CenterContainer/Label.text = str(value)
