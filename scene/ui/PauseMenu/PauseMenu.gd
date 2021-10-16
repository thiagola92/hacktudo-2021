extends CenterContainer


func _ready():
	get_tree().paused = true


func _on_Resume_pressed():
	get_tree().paused = false
	hide()
