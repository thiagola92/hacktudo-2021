extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var move = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if move > 0 && $AnimatedSprite.is_playing():
		$AnimatedSprite.position.x += move
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_try_again_pressed():
	move = 5
	$AnimatedSprite.play('roll')
	pass

func _on_quit_pressed():
	get_tree().quit()


func _on_AnimatedSprite_animation_finished():
	if move > 0:
		move = 0
		get_tree().change_scene("res://scene/main_scene/main_scene.tscn")
