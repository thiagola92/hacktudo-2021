extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# For test purpose only
	if $"." in get_tree().get_root().get_children():
		popup_centered()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
