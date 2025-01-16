extends RigidBody2D

func _integrate_forces(state):
	# Ensure the object continues in a straight line
	linear_velocity = linear_velocity.normalized() * linear_velocity.length()
