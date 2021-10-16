extends ColorRect


func _ready():
	pass


func _on_Resume_pressed():
	get_tree().paused = false
	hide()


func _on_PauseMenu_draw():
	get_tree().paused = true
