extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	$clockLabel.text = Global.time
	$moneyLabel.text = String(Global.money)
	$mentalHealth_fill.value = Global.humor
	$health_fill.value = Global.health	

func _on_computer_gui_input(event):
	if Input.is_action_just_pressed("ui_left_click"):
		$Window.popup_centered()
