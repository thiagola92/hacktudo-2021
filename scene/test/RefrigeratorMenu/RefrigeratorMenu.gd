extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# For test purpose only
	if $"." in get_tree().get_root().get_children():
		popup_centered()
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)
	add_food("res://image/game/foods/DISH2.png", "Bolo", "-1", "+5", 3.80)


func add_food(spr, name, health_effect, mood_effect, price):

	var texture = TextureRect.new()
	var button = Button.new()
	var vbox = VBoxContainer.new()
	vbox.size_flags_horizontal = SIZE_EXPAND_FILL
	vbox.size_flags_vertical = SIZE_EXPAND_FILL
	vbox.hint_tooltip = name+"\nVariação de fome: "+String(health_effect)+"\nVariação de humor: "+String(mood_effect)
	
	button.text = "Comer"
	texture.texture = load(spr)
	texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture.rect_min_size.x = 50
	texture.rect_min_size.y = 50
	
	vbox.add_child(texture)
	vbox.add_child(button)
	$VBoxContainer/FoodGrid.add_child(vbox)
	
