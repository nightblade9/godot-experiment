# Use KinematicBody2D for keyboard movement
extends RigidBody2D

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _integrate_forces(state):
	$PhysicsKeyboardMove2D._integrate_forces(state)