extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var initialMoney = 1234
var initialHour = "01:23"
var currentDay = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	$clockLabel.text = initialHour
	$moneyLabel.text = String(initialMoney)
	$mentalHealth_fill.value = 100
	$health_fill.value = 100
	
	pass # Replace with function body.

func processHealth (newHealth):
	$health_fill.value = newHealth
	
	if ($health_fill.value == 0): #game over?
		pass

func processMentalHealth (newHealth):
	$mentalHealth_fill.value = newHealth
	
	if ($mentalHealth_fill.value == 0): #game over?
		pass
	

func addOrRemoveMoney (money):
	var currentMoney = int($moneyLabel.text) + money
	if (currentMoney <= 0): # game over
		pass
	
	$moneyLabel.text = String(currentMoney)
	
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
	print(currentTime)
	
	$clockLabel.text = String(currentTime[0]) + ":" + String(currentTime[1])
		
func passDay ():
	currentDay += 1
