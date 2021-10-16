extends WindowDialog


func _ready():
	# For test purpose only
	if $"." in get_tree().get_root().get_children():
		popup_centered()
	
	add_action('oi', '40', '50', '49', 'financeiro', '')
	add_action(':)', '40', '50', '49', 'financeiro', '')
	add_action('pq', '40', '50', '49', 'financeiro', '')


var actions = []


func add_action(name, perc, ac, risc, ramo, action_type):
	actions.append({
		'nome': name,
		'perc': perc,
		'ac': ac,
		'risc': risc,
		'ramo': ramo,
		'type': action_type
	})
