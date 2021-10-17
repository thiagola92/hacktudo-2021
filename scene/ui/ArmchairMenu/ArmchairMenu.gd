extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health = 0
var mood = 0
var last_value = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if $"." in get_tree().get_root().get_children():
		popup_centered()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HSlider_value_changed(value):
	$VBoxContainer/VBoxContainer/NumberTime.text = str(value)

	if last_value >= value:
		health += (last_value-value) * -5
		mood += (last_value-value) * -10
	elif last_value <= value:
		health -= (value-last_value) * -5
		mood -= (value-last_value) * -10
	
	$VBoxContainer/ResultView/MoodContainer/Mood.text = str(mood)
	$VBoxContainer/ResultView/HealthContainer/Health.text = str(health)
	last_value = $VBoxContainer/VBoxContainer/TimeSetter/HSlider.value


func _on_Confirm_pressed():
	
	Global.health += int(health)
	if Global.health >= 100:
		Global.health = 100
	if Global.health <= 0:
		Global.health = 0
	Global.humor += int(mood)
	if Global.humor >= 100:
		Global.humor = 100
	if Global.humor <= 0:
		Global.humor = 0
	Global.passTime(last_value,0)
	self.hide()
	
