extends RigidBody2D

func _integrate_forces(state):
	# Ensure the object continues in a straight line
	linear_velocity = linear_velocity.normalized() * linear_velocity.length()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is BatwingBertha:
		body.kill_batwing_bertha()
	elif body is Bully:
		body.add_hits(1)
	elif body is MagmaJimmy:
		body.add_hits(1)
