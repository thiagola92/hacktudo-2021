extends VBoxContainer


signal food_bought(food)


var food : Dictionary


func _ready():
	pass


func set_food(f : Dictionary):
	food = f
	
	$Picture.texture = load(food['sprite'])


func _on_Buy_pressed():
	emit_signal("food_bought", food)
