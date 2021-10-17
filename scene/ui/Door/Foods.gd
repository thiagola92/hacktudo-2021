extends GridContainer


var Food = preload("res://scene/ui/Door/Food/Food.tscn")


func _ready():
	reload()


func reload():
	clear()
	
	add_jobs()


func add_jobs():
	for f in GlobalFood.allFoods:
		var food = Food.instance()
		food.set_food(f)
		add_child(food)


func clear():
	for c in get_children():
		remove_child(c)
