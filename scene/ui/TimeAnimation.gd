extends TextureProgress


func _ready():
	pass


func _process(delta):
	if Global.time_elapsing:
		value += 2
	else:
		value = 0


func _on_TimeAnimation_value_changed(value):
	if value == 100:
		Global.time_elapsing = false
