extends Node

var daysWithoutWork = 0
var workedToday = false
var changedJobs = false;

var disponibleJobs = []
var currentJob

func _process(delta):
	verify_job()

func _ready():
	add_job('Trabalho #1', '8:00', -30, -20, 100, 3)
	add_job('Trabalho #2', '6:00', -20, -10, 80, 3)
	add_job('Trabalho #3', '6:00', -30, -20, 100, 1)
	add_job('Trabalho #4', '4:00', -10, -10, 50, 7)
	add_job('Trabalho #5', '4:00', -5, -5, 30, 1)
	add_job('Trabalho #6', '8:00', -40, -50, 250, 1)
	
	currentJob = {
		'name': 'Trabalho #1',
		'time': '8:00',
		'humor': -30,
		'health': -20,
		'pay': 100,
		'daysUntilFired': 3
	}

func add_job (name, time, humor, health, pay, daysUntilFired):
	disponibleJobs.append({
		'name': name,
		'time': time,
		'humor': humor,
		'health': health,
		'pay': pay,
		'daysUntilFired': daysUntilFired
	})

func resetDay():
	if workedToday:
		daysWithoutWork = 0
	else:
		daysWithoutWork += 1
	
	workedToday = false
	
func verify_job ():
	if currentJob['daysUntilFired'] <= daysWithoutWork:
		currentJob = null
