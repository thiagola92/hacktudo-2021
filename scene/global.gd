extends Node

var money = 1234
var newStock = []
var ownedStock : Array = []


func _ready():
	add_newStock('oi', -40, 10, 25, 'Financeiro', 'CDB')
	add_newStock(':)', 40, 50, 50, 'Tecnológico', 'Tesouro Direto')
	add_newStock('teste', 30, -50, 75, 'Oléo & Gás', 'Ação')
	
	add_ownedStock('xxx', 12345.00, 23456.00, 24456.00, 'Financeiro', 'CDB')
	add_ownedStock('yyy', 67890.00, 78901.00, 77901.00, 'Tecnológico', 'Tesouro Direto')
	add_ownedStock('zzz', 100.00, 20.00, 20.00, 'Oléo & Gás', 'Ação')


func add_newStock(_name, index, variation, risk, cluster, _type):
	newStock.append({
		'name': _name,
		'index': index,
		'variation': variation,
		'risk': risk,
		'cluster': cluster,
		'type': _type
	})


func add_ownedStock (_name, initial_stock, current_stock, balance, cluster, _type): 
	ownedStock.append({
		'name': _name,
		'initial_stock': initial_stock,
		'current_stock': current_stock,
		'balance': balance,
		'variation': calc_variation(initial_stock, current_stock),
		'cluster': cluster,
		'type': _type
	})


func calc_variation(initial_stock, current_stock):
	return (current_stock - initial_stock) / initial_stock


func calc_current_stock(current_stock, stock_variation):
	return current_stock * (1 + stock_variation)
