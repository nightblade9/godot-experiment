extends KinematicBody2D

const VELOCITY_PER_SECOND = 200
var event = null

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
	# on keyboard cursor key
	if event is InputEventKey:
	
		if event.pressed and event.scancode == KEY_RIGHT:
			move_and_slide(Vector2(VELOCITY_PER_SECOND , 0))
		if event.pressed and event.scancode == KEY_LEFT:
			move_and_slide(Vector2(-VELOCITY_PER_SECOND , 0))
		if event.pressed and event.scancode == KEY_DOWN:
			move_and_slide(Vector2(0, VELOCITY_PER_SECOND ))
		if event.pressed and event.scancode == KEY_UP:
			move_and_slide(Vector2(0, -VELOCITY_PER_SECOND ))
	
func _input(event):
	self.event = event