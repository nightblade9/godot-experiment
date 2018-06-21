###
# To integrate this in your entity, add the following line to _integrate_forces(state):
# $PhysicsKeyboardMove2D._integrate_forces(state)
###
extends RigidBody2D

export (int) var acceleration = 2000
export (int) var max_movement_speed = 800

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _integrate_forces(state):
	var velocity = state.get_linear_velocity()
	
	var gained_velocity = acceleration * state.step
	
	if Input.is_key_pressed(KEY_LEFT) and velocity.x > -max_movement_speed:
		velocity.x -= gained_velocity
	if Input.is_key_pressed(KEY_RIGHT) and velocity.x < max_movement_speed:
		velocity.x += gained_velocity
	if Input.is_key_pressed(KEY_UP) and velocity.y > -max_movement_speed:
		velocity.y -= gained_velocity
	if Input.is_key_pressed(KEY_DOWN) and velocity.y < max_movement_speed:
		velocity.y += gained_velocity
	
	velocity = Vector2(lerp(velocity.x, 0, 0.05), lerp(velocity.y, 0, 0.05))
	velocity += state.get_total_gravity() * state.step
	state.set_linear_velocity(velocity)