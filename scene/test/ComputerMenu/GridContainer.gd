extends GridContainer


func _ready():
	pass


func add_line():
	var label_name = Label.new()
	var index = Label.new()
	var acumulado = Label.new()
	var buy = Button.new()
	var sell = Button.new()
	

	add_child(label_name)
	add_child(index)
	add_child(acumulado)
	add_child(buy)
	add_child(sell)


func remove_all():
	pass
	
