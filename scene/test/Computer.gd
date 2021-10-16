extends TextureRect


func _ready():
	pass


func _on_Computer_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			print("hi :(")
			get_tree().paused = true
			$AcceptDialog.popup_centered()


func _on_AcceptDialog_confirmed():
	get_tree().paused = false


func _on_AcceptDialog_popup_hide():
	get_tree().paused = false
