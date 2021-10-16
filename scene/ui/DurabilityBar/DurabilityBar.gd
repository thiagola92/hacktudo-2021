extends TextureProgress


var default_lost : float = 1
var bad_chance : float = 0.0
var bad_damage : float = 0


func _ready():
	value = 100
	
	randomize()


func _process(delta):
	if Input.is_action_just_pressed("ui_left_click"):
		lose_durability()


func lose_durability():
	value -= default_lost
	
	if randf() > bad_chance:
		value -= bad_damage
