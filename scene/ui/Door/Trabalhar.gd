extends VBoxContainer


const base_more = """[color=yellow]Humor[/color]: %s
[color=aqua]Saúde[/color]: %s
[color=lime]Pagamento[/color]: R$%s
Não faltar mais que [color=red]%s[/color] dias"""
var job


func _ready():
	pass


func _on_Trabalhar_draw():
	job = GlobalJobs.currentJob
	
	if job:
		return set_job()
	return unset_job()


func set_job():
	$BasicInfo/Title.text = job['name']
	
	set_duration()
	set_more()
	
	$BasicInfo.show()
	$Description.show()
	$StartWork.disabled = false


func set_duration():
	$BasicInfo/Duration.text = "Duration: %s" % str(job['time'])


func set_more():
	$Description.bbcode_text = base_more % [
		str(job['humor']),
		str(job['health']),
		str(job['pay']),
		str(job['daysUntilFired'])
	]


func unset_job():
	$BasicInfo.hide()
	$Description.hide()
	$StartWork.disabled = true
	


func _on_StartWork_pressed():
	GlobalJobs.work()
