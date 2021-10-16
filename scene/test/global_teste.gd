extends Node


var newStock = []
var ownedStock = []


func _ready():
	add_newStock('oi', '-40', '10', '25', 'financeiro', '')
	add_newStock(':)', '40', '50', '50', 'financeiro', '')
	add_newStock('teste', '30', '-50', '75', 'financeiro', '')
	
	add_ownedStock('xxx', '12345.00', '23456.00', '0.90004')
	add_ownedStock('yyy', '67890.00', '78901.00', '0.16218')
	add_ownedStock('zzz', '10.00', '20.00', '1.00')



func add_newStock(name, perc, ac, risc, ramo, action_type):
	newStock.append({
		'nome': name,
		'perc': perc,
		'ac': ac,
		'risc': risc,
		'ramo': ramo,
		'type': action_type
	})

func add_ownedStock (name, initial_stock, current_stock, percentage): 
	ownedStock.append({
		'name': name,
		'initial_stock': initial_stock,
		'current_stock': current_stock,
		'percentage': percentage
	})
