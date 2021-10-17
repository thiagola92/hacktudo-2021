extends GridContainer


func _ready():
#	for i in range(0, GlobalTest.newStock.size()):
#		add_line(GlobalTest.newStock[i])
	pass

func add_line(line):
	var label_name = Control.new()
	var index = Label.new()
	var acumulado = Label.new()
	var risco = Control.new()
	var buy = Button.new()

	label_name.add_child(Label.new())	
	label_name.get_child(0).text = line['nome']
	label_name.hint_tooltip = 'Ramo: ' + line['ramo']

	index.text = line['perc']
	if (int(line['perc']) > 0):
		index.add_color_override('font_color', Color.greenyellow)
	else:
		index.add_color_override('font_color', Color.red)
	index.text += "%"
	
	acumulado.text = line['ac']
	if (int(line['ac']) > 0):
		acumulado.add_color_override('font_color', Color.greenyellow)
	else:
		acumulado.add_color_override('font_color', Color.red)
	acumulado.text += "%"

	var risco_label = Label.new()
	var intensidade
	risco_label.text = line['risc']
	if (int(line['risc']) < 26):
		risco_label.add_color_override('font_color', Color.green)
		intensidade = 'Baixo'
	elif (int(line['risc']) < 51):
		risco_label.add_color_override('font_color', Color.yellow)
		intensidade = 'Médio'
	elif (int(line['risc']) < 76):
		risco_label.add_color_override('font_color', Color.orange)
		intensidade = 'Alto'
	else:
		risco_label.add_color_override('font_color', Color.red)
		intensidade = 'Muito Alto'

	risco_label.text += "%"
	risco.add_child(risco_label)
	risco.hint_tooltip = intensidade
	
	buy.text = 'Comprar'

	add_child(label_name)
	add_child(index)
	add_child(acumulado)
	add_child(risco)
	add_child(buy)
	


func remove_all():
	pass
	
