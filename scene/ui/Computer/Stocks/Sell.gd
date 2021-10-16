extends Button


signal on_sell()


var position
var stock


func _ready():
	set_meta("position", 0)
	
	var ok_button = $ConfirmationDialog.get_ok()
	
	ok_button.connect("button_down", self, "_on_ConfirmationDialog_ok_pressed")


func _on_Sell_pressed():
	position = get_meta("position")
	stock = Global.ownedStock[position]
	
	$ConfirmationDialog/CenterContainer/HSlider.max_value = stock['current_stock']
	$ConfirmationDialog.popup_centered()


func _on_ConfirmationDialog_ok_pressed():
	var current_stock = $ConfirmationDialog/CenterContainer/HSlider.value
	
	if current_stock == 0:
		return
	
	var s = Global.ownedStock[position]
	
	if current_stock == s['current_stock']:
		Global.money += current_stock
		Global.ownedStock.remove(position)
		return
	
#	s['initial_stock'] += initial_stock
#	s['current_stock'] += initial_stock
#	s['variation'] = (s['current_stock'] - s['initial_stock']) / s['initial_stock']
#
#	Global.ownedStock[pos] = s
#	Global.money -= initial_stock
	
	emit_signal("on_sell")


func _on_HSlider_value_changed(value):
	$ConfirmationDialog/CenterContainer/Label.text = str(value)
