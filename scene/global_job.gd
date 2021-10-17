extends Node

var job = {'name': 'Trabalho #1', 'time': '8:00', 'humor': -15, 'saude': -10, 'pay': 100}

var daysWithoutWork = 0
var workedToday = false

func _ready():
	pass

func resetDay():
	if workedToday:
		daysWithoutWork = 0
	else:
		daysWithoutWork += 1
	
	workedToday = false
