extends Camera2D


func _ready():
	pass


func _process(delta):
	pc_health()
	

func pc_health():
	$Health.value -= 1
	
	if $Health.value == 0:
		$Health.hide()
		$Computer.hide()
