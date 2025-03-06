## batwing_bertha.gd
## This script defines the BatwingBertha class, which represents a floating character 
## that alternates between two target positions in the game world.

## Declare this script as a BatwingBertha class
class_name BatwingBertha

## Extends CharacterBody2D to utilize character physics and motion capabilities
extends CharacterBody2D

## Exported properties
## start_pos: Node2D - The starting position for the character
@export var start_pos: Node2D
## end_pos: Node2D - The ending position for the character
@export var end_pos: Node2D
## move_speed: float - The speed at which the character moves between positions
@export var move_speed: float

## Internal variables
## target_positions: Array - Stores the global positions of the start and end nodes
var target_positions = []
## current_target: int - Tracks the current target position index
var current_target = 0

## Called when the node enters the scene tree
func _ready() -> void:
	## Set the motion mode to floating
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

	## Ensure start_pos and end_pos nodes are assigned
	if start_pos and end_pos:
		target_positions.append(start_pos.global_position)
		target_positions.append(end_pos.global_position)
	else:
		print("Error: Node2D nodes are not assigned properly.")
		return

## Called every physics frame to handle character movement
## Parameters:
##  delta (float): The elapsed time since the last physics frame
func _physics_process(delta):
	if target_positions.size() > 0:
		## Calculate the direction to the current target and move the character
		var direction = (target_positions[current_target] - global_position).normalized()
		global_position += direction * move_speed * delta

		## Check if the character has reached the target position
		if global_position.distance_to(target_positions[current_target]) < 5:
			current_target = (current_target + 1) % target_positions.size()

## Deletes the BatwingBertha instance from the scene tree
func kill_batwing_bertha():
	get_tree().queue_delete(self)
