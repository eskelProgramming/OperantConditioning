## Represents a single Wrench. The Wrench can 
## collect coins and do damage to enemies.
class_name Wrench

extends RigidBody2D

func _integrate_forces(state):
	# Ensure the object continues in a straight line
	linear_velocity = linear_velocity.normalized() * linear_velocity.length()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is BatwingBertha:
		body.kill_batwing_bertha()
		get_tree().queue_delete(self)
	elif body is Bully:
		body.add_hits(1)
		get_tree().queue_delete(self)
	elif body is MagmaJimmy:
		body.add_hits(1)
		get_tree().queue_delete(self)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Coin:
		area.collect_coin()
