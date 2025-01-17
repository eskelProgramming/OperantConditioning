class_name BatwingBertha
extends CharacterBody2D

@export var start_pos : Node2D
@export var end_pos : Node2D
@export var move_speed : float

var target_positions = []
var current_target = 0

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

	# Ensure the Node2D nodes are assigned
	if start_pos and end_pos:
		target_positions.append(start_pos.global_position)
		target_positions.append(end_pos.global_position)
	else:
		print("Error: Area2D nodes are not assigned properly.")
		return

func _physics_process(delta):
	if target_positions.size() > 0:
		var direction = (target_positions[current_target] - global_position).normalized()
		global_position += direction * move_speed * delta

		# Check if the character has reached the target position
		if global_position.distance_to(target_positions[current_target]) < 5:
			current_target = (current_target + 1) % target_positions.size()

func kill_batwing_bertha():
	get_tree().queue_delete(self)
