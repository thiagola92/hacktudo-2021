extends Node


var actions = []


func _ready():
	add_action('oi', '40', '50', '49', 'financeiro', '')
	add_action(':)', '40', '50', '49', 'financeiro', '')
	add_action('teste', '40', '50', '49', 'financeiro', '')


func add_action(name, perc, ac, risc, ramo, action_type):
	actions.append({
		'nome': name,
		'perc': perc,
		'ac': ac,
		'risc': risc,
		'ramo': ramo,
		'type': action_type
	})
