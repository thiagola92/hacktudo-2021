extends Control

enum{IDLE, MOVE, INTERACT}

onready var nav2D : Navigation2D = $NavigationPolygon
onready var line2D : Line2D = $Line2D
onready var Player : AnimatedSprite = $Player

func _process(delta):
	if ($Player.position.x < -1040):
		$Camera2D.position.x = -1040
	elif ($Player.position.x > 1121):
		$Camera2D.position.x = 1121
	else:
		$Camera2D.position.x = $Player.position.x

func _input(event): 
	if !Input.is_action_pressed("ui_left_click"):
		return

	var new_path = nav2D.get_simple_path(Player.get_global_position(), get_global_mouse_position())
	
	line2D.points = new_path 
	
	Player.path = new_path
	Player.change_state(MOVE)
	
# sprites actions

