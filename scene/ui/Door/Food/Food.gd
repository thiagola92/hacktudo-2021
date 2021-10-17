extends VBoxContainer


signal food_bought(food, qty)


const base_text = "x %s"
var food : Dictionary
var qty = 1


func _ready():
	pass


func set_food(f : Dictionary):
	food = f
	
	$Interface/Picture.texture = load(food['sprite'])


func _on_Buy_pressed():
	emit_signal("food_bought", food, qty)


func _on_Up_pressed():
	qty += 1
	$Interface/Quantity.text = base_text % str(qty)


func _on_Down_pressed():
	if qty == 1:
		return
		
	qty -= 1
	$Interface/Quantity.text = base_text % str(qty)
