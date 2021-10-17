extends AnimatedSprite


var destination = Vector2()
var distance = Vector2()
var velocity = Vector2()
var snapPosition = Vector2()

var path : PoolVector2Array

export var speed = 600

enum{IDLE, MOVE, INTERACT}

var state = IDLE

var margin = 1

func _ready():
	destination = position

func _process(delta):
	var move_distance = speed * delta 
	
	match state:
		IDLE:
			pass
		MOVE:
			move_along_path(move_distance)
	pass
	
func move_along_path(distance):
	var starting_point : = position 
	
	if(starting_point.x < path[0].x):
		self.set_flip_h( false )
	if(starting_point.x > path[0].x):
		self.set_flip_h( true )	
	
	for _i in range(path.size()):
		var distance_to_next : = starting_point.distance_to(path[0])
		
		if (distance <= distance_to_next):
			position = starting_point.linear_interpolate(path[0], distance / distance_to_next) 
			break
		
		path.remove(0)
		
		if(path.size() == 0):
			change_state(IDLE)
	pass
	
func change_state(newState):
	state = newState
	match state: 
		IDLE:
			self.play("idle")
		MOVE:
			self.play("run")
