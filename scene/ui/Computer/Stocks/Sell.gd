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
	
	$ConfirmationDialog/CenterContainer/HSlider.max_value = stock['balance']
	$ConfirmationDialog.popup_centered()


func _on_ConfirmationDialog_ok_pressed():
	var balance = $ConfirmationDialog/CenterContainer/HSlider.value
	
	if balance == 0:
		return
	
	var s = Global.ownedStock[position]
	
	if balance == s['balance']:
		Global.money += balance
		Global.ownedStock.remove(position)
		return emit_signal("on_sell")
	
	s['balance'] -= balance

	Global.ownedStock[position] = s
	Global.money += balance
	
	emit_signal("on_sell")


func _on_HSlider_value_changed(value):
	$ConfirmationDialog/CenterContainer/Label.text = str(value)
