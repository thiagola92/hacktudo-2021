extends KinematicBody2D


var position_selected : Vector2


func _ready():
	position_selected = position


func _process(delta):
	if Input.is_action_just_pressed("ui_left_click"):
		position_selected = get_global_mouse_position()
		$Sprite.animation = 'run'
	
	if position_selected == global_position:
		$Sprite.animation = 'default'
	
	global_position = lerp(position, position_selected, 1 * delta)
	
		
