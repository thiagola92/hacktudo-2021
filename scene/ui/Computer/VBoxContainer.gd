extends VBoxContainer


var News = preload("res://scene/ui/Computer/News/News.tscn")


func _ready():
	reload()


func reload():
	clear()
	add_news()


func add_news():
	for n in GlobalNews.newsOfTheDay:
		var news = News.instance()
		news.set_news(n)
		add_child(news)


func clear():
	for child in get_children():
		remove_child(child)
