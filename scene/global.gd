extends Node


var newStock = []
var ownedStock = []


func _ready():
	add_newStock('oi', -40, 10, 25, 'Financeiro', 'CDB')
	add_newStock(':)', 40, 50, 50, 'Tecnológico', 'Tesouro Direto')
	add_newStock('teste', 30, -50, 75, 'Oléo & Gás', 'Ação')
	
	add_ownedStock('xxx', 12345.00, 23456.00, 0.90004, 'Financeiro', 'CDB')
	add_ownedStock('yyy', 67890.00, 78901.00, 0.16218, 'Tecnológico', 'Tesouro Direto')
	add_ownedStock('zzz', 100.00, 20.00, 1.00, 'Oléo & Gás', 'Ação')


func add_newStock(_name, index, variation, risk, cluster, _type):
	newStock.append({
		'name': _name,
		'index': index,
		'variation': variation,
		'risk': risk,
		'cluster': cluster,
		'type': _type
	})

func add_ownedStock (_name, initial_stock, current_stock, variation, cluster, _type): 
	ownedStock.append({
		'name': _name,
		'initial_stock': initial_stock,
		'current_stock': current_stock,
		'variation': variation,
		'cluster': cluster,
		'type': _type
	})
