extends Node

# News
var news = []
var newsOfTheDay = []

func _ready():
	add_news('Notícia 1', 'Lorem Ipsum', 'Financeiro', -0.5)
	add_news('Notícia 2', 'Lorem Ipsum', 'Financeiro', 0.5)
	add_news('Notícia 3', 'Lorem Ipsum', 'Tecnológico', -0.2)
	add_news('Notícia 4', 'Lorem Ipsum', 'Tecnológico', 0.8)
	add_news('Notícia 5', 'Lorem Ipsum', 'Oléo & Gás', -0.2)
	add_news('Notícia 6', 'Lorem Ipsum', 'Oléo & Gás', 0.3)
	add_news('Notícia 7', 'Lorem Ipsum', 'Petróleo', -0.5)
	add_news('Notícia 8', 'Lorem Ipsum', 'Dólar', 0.4)
	add_news('Notícia 9', 'Lorem Ipsum', 'Bitcoin', 0)
	add_news('Notícia 10', 'Lorem Ipsum', 'Banco', 0)
	add_news('Notícia 11', 'Lorem Ipsum', 'Clear Financeira', 0)
	add_news('Notícia 12', 'Lorem Ipsum', 'Saúde', 0)
	add_news('Notícia 13', 'Lorem Ipsum', 'Real', -0.4)
	add_news('Notícia 14', 'Lorem Ipsum', 'Cosméticos', 0)
	
	pick_two()
	
func add_news (name, description, cluster, variation):
	news.append({
		'name': name,
		'description': description,
		'cluster': cluster,
		'variation': variation
	})

func pick_two ():
	newsOfTheDay.clear()
	newsOfTheDay.append(news[randi()%14])
	newsOfTheDay.append(news[randi()%14])
