extends Control


func _ready():
	pass


func _process(delta):
	$Camera2D.position.x = $Player.position.x
