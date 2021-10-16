extends Button


signal on_sell()


var position
var stock


func _ready():
	var ok_button = $ConfirmationDialog.get_ok()
	
	ok_button.connect("button_down", self, "_on_ConfirmationDialog_ok_pressed")


func _on_Sell_pressed():
	position = get_meta("position")
	stock = GlobalStocks.ownedStock[position]
	
	$ConfirmationDialog/CenterContainer/HSlider.max_value = stock['balance']
	$ConfirmationDialog.popup_centered()


func _on_ConfirmationDialog_ok_pressed():
	var balance = $ConfirmationDialog/CenterContainer/HSlider.value
	
	if balance == 0:
		return
	
	Global.passTime(0, 15)
	var s = GlobalStocks.ownedStock[position]
	
	if balance == s['balance']:
		Global.money += balance
		GlobalStocks.ownedStock.remove(position)
		return emit_signal("on_sell")
	
	s['balance'] -= balance

	GlobalStocks.ownedStock[position] = s
	Global.money += balance
	
	emit_signal("on_sell")


func _on_HSlider_value_changed(value):
	$ConfirmationDialog/CenterContainer/Label.text = str(value)
