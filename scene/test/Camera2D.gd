extends Camera2D


func _ready():
	pass


func _process(delta):
	position.x += 1
	
	$Health.value -= 1
	
	if $Health.value == 0:
		$Health.hide()
		$Computer.hide()
