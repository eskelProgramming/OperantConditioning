## Represents a single Wrench. 
##
## The Wrench can collect coins and do damage to enemies.
class_name Wrench

# Inherits from RigidBody2D
extends RigidBody2D

## Makes sure the [Wrench] continues in a straight line. 
func _integrate_forces(state):
	linear_velocity = linear_velocity.normalized() * linear_velocity.length()

## Checks if the wrench has hit an enemy, and if it has,
## calls the respective enemy method to handle it. Afterwards the [Wrench]
## deletes itself from the tree. 
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

## Checks if it has entered a [Coin], and if it has calls 
## [method Coin.collect_coin] to collect the coin. 
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Coin:
		area.collect_coin()
