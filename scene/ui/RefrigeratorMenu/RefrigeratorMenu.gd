extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# For test purpose only
	if $"." in get_tree().get_root().get_children():
		popup_centered()

func _draw():
	for food in GlobalFood.ownedFoods:
		add_food(food['sprite'], food['name'], str(food['health']), str(food['humor']), food['price'])


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
	
	button.connect("pressed", self, "food_effect", [health_effect, mood_effect, vbox])
#	Global.health = 50
#	Global.humor = 50
	vbox.add_child(texture)
	vbox.add_child(button)
	$ScrollContainer/VBoxContainer/FoodGrid.add_child(vbox)
	
func food_effect(health, mood, food_box):
	
	Global.health += int(health)
	if Global.health >= 100:
		Global.health = 100
	if Global.health <= 0:
		Global.health = 0
	Global.humor += int(mood)
	if Global.humor >= 100:
		Global.humor = 100
	if Global.humor <= 0:
		Global.humor = 0
	
	$ScrollContainer/VBoxContainer/FoodGrid.remove_child(food_box)
	pass


func _on_WindowDialog_popup_hide():
	pass # Replace with function body.


func _on_WindowDialog_about_to_show():
	pass # Replace with function body.


func _on_RefrigeratorWindow_about_to_show():
	pass # Replace with function body.
