extends Node

#Status
var money = 1234
var time = "06:00"
var currentDay = 1
var health = 100
var humor = 100

func _ready():
	pass
	

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
	var strArray = time.split(":")
	var currentTime = [int(strArray[0]), int(strArray[1])]

	currentTime = verifyHour(currentTime, hourSpent)
	currentTime = verifyMinute(currentTime, minuteSpent)
	
	Global.time = String(currentTime[0]) + ":" + String(currentTime[1])
	
func passDay ():
	Global.currentDay += 1

