extends VBoxContainer


func _ready():
	pass


func set_duration(duration):
	$Line/Duration.text = "Duration: %s" % str(duration)


func set_more(humor, health, pay):
	$More/RichTextLabel.text = "Humor: %s\nSaúde: %s\nPagamento: R$%s" % [
		str(humor), str(health), str(pay)
	]


func _on_Line_gui_input(event):
	if Input.is_action_just_pressed("ui_left_click") and not $More.visible:
		$More.show()
	elif Input.is_action_just_pressed("ui_left_click") and $More.visible:
		$More.hide()
