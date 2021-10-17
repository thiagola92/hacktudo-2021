extends ColorRect


var process_next_cancel = false


func _ready():
	hide()


func pause():
	show()
	
	get_tree().paused = true


func resume():
	hide()
	
	get_tree().paused = false
