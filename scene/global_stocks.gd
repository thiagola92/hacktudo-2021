extends Node

# Stocks
var newStock = []
var ownedStock : Array = []


func _ready():
	add_newStock('xxx', -40, 10, 25, 'Financeiro', 'CDB')
	add_newStock('yyy', 40, 50, 50, 'Tecnológico', 'Tesouro Direto')
	add_newStock('zzz', 30, -50, 75, 'Oléo & Gás', 'Ação')
	
	add_ownedStock('xxx', 12345.00, 23456.00, 24456.00, 'Financeiro', 'CDB')
	add_ownedStock('yyy', 67890.00, 78901.00, 77901.00, 'Tecnológico', 'Tesouro Direto')
	add_ownedStock('zzz', 100.00, 20.00, 20.00, 'Oléo & Gás', 'Ação')
	
	calc_stocks()


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

func calc_balance(balance, stock_variation):
	return balance * (1 + stock_variation)


func calc_stocks ():
	print('aaaa')
	print(newStock)
	print(ownedStock)
	
	var indexesNews = [
		{'cluster': GlobalNews.newsOfTheDay[0]['cluster'], 'index': GlobalNews.newsOfTheDay[0]['variation']},
		{'cluster': GlobalNews.newsOfTheDay[1]['cluster'], 'index': GlobalNews.newsOfTheDay[1]['variation']},
	]
	
	var indexes = []
	var order = []
	
	for stock in newStock:
		order.append(stock['name'])
		
		if (indexesNews[0]['cluster'] == stock['cluster']):
			indexes.append(indexesNews[0]['index'])
			stock['index'] = indexesNews[0]['index']
			stock['variation'] += indexesNews[0]['index']
		elif (indexesNews[1]['cluster'] == stock['cluster']):
			indexes.append(indexesNews[1]['index'])
			stock['index'] = indexesNews[1]['index']
			stock['variation'] += indexesNews[1]['index']
		else:
			var random = rand_range(-1, 1)
			indexes.append(random)	
			stock['index'] = random
			stock['variation'] += random
			
	for stock in ownedStock:
		for pos in range(0, order.size()):
			if (stock['name'] == order[pos]):
				stock['current_stock'] = calc_current_stock(stock['current_stock'], indexes[pos])
				stock['balance'] = calc_balance(stock['balance'], indexes[pos])
				stock['variation'] = calc_variation(stock['initial_stock'], stock['current_stock'])
		
	print(newStock)
	print(ownedStock)
