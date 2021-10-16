extends GridContainer


func _ready():
	for i in range(0, GlobalTest.actions.size()):
		add_line(GlobalTest.actions[i])


func add_line(line):
	var label_name = Label.new()
	var index = Label.new()
	var acumulado = Label.new()
	var risco = Label.new()
	var buy = Button.new()
	
	label_name.text = line['nome']
	index.text = line['perc']
	acumulado.text = line['ac']
	risco.text = line['risc']
	buy.text = 'Comprar'

	add_child(label_name)
	add_child(index)
	add_child(acumulado)
	add_child(risco)
	add_child(buy)
	


func remove_all():
	pass
	
