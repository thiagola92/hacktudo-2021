extends VBoxContainer


var Job = preload("res://scene/ui/Computer/Job/Job.tscn")


func _ready():
	reload()


func reload():
	clear()
	
	add_jobs()


func add_jobs():
	for j in GlobalJobs.disponibleJobs:
		var job = Job.instance()
		job.set_job(j)
		job.connect("job_selected", self, 'reload')
		add_child(job)


func clear():
	for c in get_children():
		remove_child(c)
