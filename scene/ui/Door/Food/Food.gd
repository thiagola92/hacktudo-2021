extends VBoxContainer


const base_text = "x %s"
var food : Dictionary
var qty = 1


func _ready():
	pass


func set_food(f : Dictionary):
	food = f
	
	$Interface/Picture.texture = load(food['sprite'])


func _on_Buy_pressed():
	if qty * food['price'] > Global.money:
		return
	
	for i in range(0, qty):
		GlobalFood.add_ownedFoodDict(food)
		
	Global.money -= qty * food['price']


func _on_Up_pressed():
	qty += 1
	$Interface/Quantity.text = base_text % str(qty)


func _on_Down_pressed():
	if qty == 1:
		return
		
	qty -= 1
	$Interface/Quantity.text = base_text % str(qty)
