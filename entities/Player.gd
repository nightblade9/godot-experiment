# Use KinematicBody2D for keyboard movement
extends RigidBody2D

const VELOCITY_PER_SECOND = 200

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
	pass
#	self._move_to_keyboard()

func _input(event):
	self._trigger_impulse_movement(event)

func _trigger_impulse_movement(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_RIGHT:
			apply_impulse(Vector2(0, 0), Vector2(VELOCITY_PER_SECOND, 0))
		if event.scancode == KEY_LEFT:
			apply_impulse(Vector2(0, 0), Vector2(-VELOCITY_PER_SECOND, 0))
		if event.scancode == KEY_DOWN:
			apply_impulse(Vector2(0, 0), Vector2(0, VELOCITY_PER_SECOND))
		if event.scancode == KEY_UP:
			apply_impulse(Vector2(0, 0), Vector2(0, -VELOCITY_PER_SECOND))

# Moves smoothly in eight directions
func _move_to_keyboard():
	if Input.is_key_pressed(KEY_RIGHT):
		move_and_slide(Vector2(VELOCITY_PER_SECOND, 0))
	if Input.is_key_pressed(KEY_LEFT):
		move_and_slide(Vector2(-VELOCITY_PER_SECOND, 0))
	if Input.is_key_pressed(KEY_DOWN):
		move_and_slide(Vector2(0, VELOCITY_PER_SECOND))
	if Input.is_key_pressed(KEY_UP):
		move_and_slide(Vector2(0, -VELOCITY_PER_SECOND))