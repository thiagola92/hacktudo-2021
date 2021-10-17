extends VBoxContainer


const base_more = """[color=yellow]Humor[/color]: %s
[color=aqua]Saúde[/color]: %s
[color=lime]Pagamento[/color]: R$%s
Não faltar mais que [color=red]%s[/color] dias"""


func _ready():
	$More.hide()


func set_job(job):
	$Line/Title.text = job['name']
	set_duration(job['time'])
	set_more(job['humor'], job['health'], job['pay'], job['daysUntilFired'])


func set_duration(duration):
	$Line/Duration.text = "Duration: %s" % str(duration)


func set_more(humor, health, pay, days_until_fired):
	$More/RichTextLabel.bbcode_text = base_more % [
		str(humor), str(health), str(pay), str(days_until_fired)
	]


func _on_Line_gui_input(event):
	if Input.is_action_just_pressed("ui_left_click") and not $More.visible:
		$More.show()
	elif Input.is_action_just_pressed("ui_left_click") and $More.visible:
		$More.hide()


func _on_Select_gui_input(event):
	print(event)
	if Input.is_action_just_pressed("ui_left_click"):
		pass
	pass # Replace with function body.
