extends ColorRect


func _ready():
	pass


func _on_Resume_pressed():
	get_tree().paused = false
	hide()


func pause():
	get_tree().paused = true
