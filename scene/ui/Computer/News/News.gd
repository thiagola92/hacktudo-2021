extends VBoxContainer


var reading = true


func _ready():
	_on_Read_pressed()


func set_news(n):
	$Basic/Title.text = n['name']
	$More.text = n['description']
	$Basic/Cluster.text = n['cluster']
	
	set_status(n['variation'])


func set_status(variation):
	if variation >= 0:
		$Basic/Status.icon = load("res://image/ui/icon_arrow_up.svg")
	else:
		$Basic/Status.icon = load("res://image/ui/icon_arrow_down.svg")


func _on_Read_pressed():
	reading = !reading
	
	if reading:
		$More.show()
		$Basic/Read.text = "Ler menos..."
	else:
		$More.hide()
		$Basic/Read.text = "Ler mais..."
