extends Node

var daysWithoutWork = 0
var workedToday = false
var changedJobs = false;

var allJobs = []
var disponibleJobs = []
var currentJob

func _process(delta):
	verify_job()

func _ready():
	randomize()

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
	
	pick_tree()

func add_job (name, time, humor, health, pay, daysUntilFired):
	allJobs.append({
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
	pick_tree()
	
func work():
	Global.health += currentJob['health']
	Global.humor += currentJob['humor']
	Global.money += currentJob['pay']
	var time = currentJob['time'].split(":")
	Global.passTime(int(time[0]), int(time[1]))
	workedToday = true
	
func resetJobBlock ():
	changedJobs = false;

func changeJobs(job):
	currentJob = job
	changedJobs = true
	var daysWithoutWork = 0
	
func verify_job ():
	if currentJob['daysUntilFired'] <= daysWithoutWork:
		currentJob = null

func pick_tree ():
	disponibleJobs.clear()
	disponibleJobs.append(allJobs[randi()%6])
	disponibleJobs.append(allJobs[randi()%6])
