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

func processHealth (newHealth):
	$health_fill.value = newHealth
	Global.health = newHealth
	
	if ($health_fill.value == 0): #game over?
		pass

func processMentalHealth (newHealth):
	$mentalHealth_fill.value = newHealth
	Global.humor = newHealth
	
	if ($mentalHealth_fill.value == 0): #game over?
		pass
	

func addOrRemoveMoney (money):
	var currentMoney = int($moneyLabel.text) + money
	if (currentMoney <= 0): # game over
		pass
	
	$moneyLabel.text = String(currentMoney)
	Global.money = currentMoney
	
func verifyHour (currentTime, hourSpent):
	var currentHour = currentTime[0]
	if (currentHour + hourSpent > 23):
		passDay()
		currentHour = (currentHour + hourSpent) - 24
	else:
		currentHour = currentHour + hourSpent
	
	currentTime[0] = currentHour
	return currentTime
	
func verifyMinute (currentTime, minuteSpent):
	var currentMinute = currentTime[1]
	if (currentMinute + minuteSpent > 60):
		currentMinute = (currentMinute + minuteSpent) - 60
		currentTime = verifyHour(currentTime, 1)
	else:
		currentMinute = currentMinute + minuteSpent
		
	currentTime[1] = currentMinute
	return currentTime
			
func passTime (hourSpent, minuteSpent):
	var strArray = $clockLabel.text.split(":")
	var currentTime = [int(strArray[0]), int(strArray[1])]

	currentTime = verifyHour(currentTime, hourSpent)
	currentTime = verifyMinute(currentTime, minuteSpent)
	
	$clockLabel.text = String(currentTime[0]) + ":" + String(currentTime[1])
	Global.time = String(currentTime[0]) + ":" + String(currentTime[1])
	
func passDay ():
	Global.currentDay += 1


func _on_computer_gui_input(event):
	if Input.is_action_just_pressed("ui_left_click"):
		$Window.popup_centered()
