extends TextureProgress


var running = false


func _ready():
	start()


func start():
	value = 0
	
	show()


func _process(delta):
	value += 2


func _on_TimeAnimation_value_changed(value):
	if value == 100:
		hide()
