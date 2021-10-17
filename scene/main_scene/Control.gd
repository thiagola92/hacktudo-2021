extends Control

enum{IDLE, MOVE, INTERACT}
var busyPopup = false

onready var nav2D : Navigation2D = $NavigationPolygon
onready var line2D : Line2D = $Line2D
onready var Player : AnimatedSprite = $Player
onready var Dog : AnimatedSprite = $Dog

func _process(_delta):
	if ($Player.position.x < -1040):
		$Camera2D.position.x = -1040
	elif ($Player.position.x > 1121):
		$Camera2D.position.x = 1121
	else:
		$Camera2D.position.x = $Player.position.x

func _input(_event): 
	if Input.is_action_just_pressed("ui_cancel") and not busyPopup:
		return $Camera2D/HUD/Canvas/PauseMenu.pause()
		
	if !Input.is_action_just_pressed("ui_left_click") || busyPopup:
		return
	
	var new_path = nav2D.get_simple_path(Player.get_global_position(), get_global_mouse_position())
	
	line2D.points = new_path 
	
	Player.path = new_path
	Player.change_state(MOVE)


func _on_bookcase_gui_input(_event):
	pass # Replace with function body.


func _on_clock_gui_input(_event):
	pass # Replace with function body.


func _on_Window_about_to_show():
	busyPopup = true


func _on_Window_popup_hide():
	busyPopup = false

func _on_RefrigeratorWindow_about_to_show():
	busyPopup = true


func _on_RefrigeratorWindow_popup_hide():
	busyPopup = false


func _on_Timer_timeout():
	var variation = rand_range(-500, 500)

	var newPosition = Dog.get_global_position()
	newPosition.x += variation

	var new_path = nav2D.get_simple_path(Dog.get_global_position(), newPosition)
	
	line2D.points = new_path 
	
	Dog.path = new_path
	Dog.change_state(MOVE)
