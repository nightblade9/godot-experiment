extends KinematicBody2D

const VELOCITY_PER_SECOND = 200

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		move_and_slide(Vector2(VELOCITY_PER_SECOND, 0))
	if Input.is_key_pressed(KEY_LEFT):
		move_and_slide(Vector2(-VELOCITY_PER_SECOND, 0))
	if Input.is_key_pressed(KEY_DOWN):
		move_and_slide(Vector2(0, VELOCITY_PER_SECOND))
	if Input.is_key_pressed(KEY_UP):
		move_and_slide(Vector2(0, -VELOCITY_PER_SECOND))