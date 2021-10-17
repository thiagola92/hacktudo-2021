extends Node


var allFoods = []
var ownedFoods = []


func _ready():
	add_newFood('Maçã', 1, 5, '0:0', 5.00, 'res://image/game/foods/APPLE.png')
	add_newFood('Pão', 2, 2, '3:0', 10.00, 'res://image/game/foods/BREAD.png')
	add_newFood('Queijo', 3, 2, '0:0', 9.00, 'res://image/game/foods/CHEESE.png')
	add_newFood('Cereja', 5, 25, '0:0', 29.00, 'res://image/game/foods/CHERRY.png')
	add_newFood('Coco', 5, 25, '0', 30.00, 'res://image/game/foods/COCONUT.png')
	add_newFood('Café', 15, -5, '0:05', 4.50, 'res://image/game/foods/COFFEE.png')
	add_newFood('Bolo', 15, -10, '1:30', 9.00, 'res://image/game/foods/DISH2.png')
	add_newFood('Almôndegas', 5, -2, '01:00', 20.00, 'res://image/game/foods/DISH3.png')
	add_newFood('Torta', 20, -15, '02:00', 9.50, 'res://image/game/foods/DISH4.png')
	add_newFood('Hamburger', 25, -30, '0:20', 42.00, 'res://image/game/foods/DISH5.png')
	add_newFood('Gelatina de Framboesa', 1, 1, '0:10', 2.00, 'res://image/game/foods/DISH6.png')
	add_newFood('Gelatina de Limão', 1, 1, '0:10', 2.00, 'res://image/game/foods/DISH7.png')
	add_newFood('Espaguete', 5, 7, '00:11', 10.00, 'res://image/game/foods/DISH.png')
	add_newFood('Peixe', -10, 35, '0:45', 50.00, 'res://image/game/foods/FISH.png')
	add_newFood('Sorvete', 18, -30, '0:30', 5.00, 'res://image/game/foods/ICECR3.png')
	add_newFood('Pão integral', -14, 25, '3:0', 20.00, 'res://image/game/foods/LOAF.png')
	
	add_ownedFood('Gelatina de Framboesa', 1, 1, '0:10', 2.00, 'res://image/game/foods/DISH6.png')
	add_ownedFood('Pão', 2, 2, '3:0', 10.00, 'res://image/game/foods/BREAD.png')
	add_ownedFood('Queijo', 3, 2, '0:0', 9.00, 'res://image/game/foods/CHEESE.png')
	add_ownedFood('Café', 15, -5, '0:05', 4.50, 'res://image/game/foods/COFFEE.png')
	
	

func add_newFood(name, humor, health, cooking_time, price, sprite):
	allFoods.append({
		'name': name,
		'humor': humor,
		'health': health,
		'cooking_time': cooking_time, 
		'price': price,
		'sprite': sprite
	})

func add_ownedFood(name, humor, health, cooking_time, price, sprite):
	ownedFoods.append({
		'name': name,
		'humor': humor,
		'health': health,
		'cooking_time': cooking_time, 
		'price': price,
		'sprite': sprite
	})	

func add_ownedFoodDict(food):
	ownedFoods.append(food)	

