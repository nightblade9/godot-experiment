# Use KinematicBody2D for keyboard movement
extends RigidBody2D

const VELOCITY_PER_SECOND = 100
var active_thrusters = []

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
	if not Input.is_key_pressed(KEY_RIGHT) and "right" in self.active_thrusters:
		self.active_thrusters.remove("right")
	if not Input.is_key_pressed(KEY_LEFT) and "left" in self.active_thrusters:
		self.active_thrusters.remove("left")
	if not Input.is_key_pressed(KEY_UP) and "up" in self.active_thrusters:
		self.active_thrusters.remove("up")
	if not Input.is_key_pressed(KEY_DOWN) and "down" in self.active_thrusters:
		self.active_thrusters.remove("down")

func _input(event):
	self._trigger_impulse_movement(event)

func _trigger_impulse_movement(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_RIGHT and not "right" in self.active_thrusters:
			active_thrusters.append("right")
			self.apply_impulse(Vector2(0, 0), Vector2(VELOCITY_PER_SECOND, 0))
		if event.scancode == KEY_LEFT and not "left" in self.active_thrusters:
			self.active_thrusters.append("left")
			self.apply_impulse(Vector2(0, 0), Vector2(-VELOCITY_PER_SECOND, 0))
		if event.scancode == KEY_DOWN and not "down" in self.active_thrusters:
			self.active_thrusters.append("down")
			self.apply_impulse(Vector2(0, 0), Vector2(0, VELOCITY_PER_SECOND))
		if event.scancode == KEY_UP and not "up" in self.active_thrusters:
			self.active_thrusters.append("up")
			self.apply_impulse(Vector2(0, 0), Vector2(0, -VELOCITY_PER_SECOND))
	
# Moves smoothly in eight directions
func _move_to_keyboard():
	if Input.is_key_pressed(KEY_RIGHT):
		self.apply_impulse(Vector2(0, 0), Vector2(VELOCITY_PER_SECOND, 0))
	if Input.is_key_pressed(KEY_LEFT):
		self.apply_impulse(Vector2(0, 0), Vector2(-VELOCITY_PER_SECOND, 0))
	if Input.is_key_pressed(KEY_DOWN):
		self.apply_impulse(Vector2(0, 0), Vector2(0, VELOCITY_PER_SECOND))
	if Input.is_key_pressed(KEY_UP):
		self.apply_impulse(Vector2(0, 0), Vector2(0, -VELOCITY_PER_SECOND))