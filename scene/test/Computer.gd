extends TextureRect


func _ready():
	pass


func _on_Computer_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			print("hi :(")
