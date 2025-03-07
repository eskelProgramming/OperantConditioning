## A floating character that alternates between two target positions in the game world.
##
## This class inherits from [CharacterBody2D], and is an enemy 
## that can interact with [Mac]. If [Mac] collides with a 
## [BatwingBertha], [method Mac.reset_mac] is called and 
## the level is reset.  
class_name BatwingBertha

# Extends CharacterBody2D to utilize character physics and motion capabilities.
extends CharacterBody2D

## The target starting position for [BatwingBertha].
## The start_pos and [BatwingBertha] need to be placed on the 
## same tile. 
@export var start_pos: Node2D
## The target ending position for [BatwingBertha].
@export var end_pos: Node2D
## The speed at which [BatwingBertha] moves between target positions.
@export var move_speed: float = 20.0

# Internal variables

## Stores the global positions of the start and end nodes within the scene.
## Initialized in [method BatwingBertha._ready].
var target_positions: Array[Vector2]
## Tracks the current target position index.
var current_target: int = 0

## Called when the node enters the scene tree. Prepares object to 
## interact with the game. Assigns [member BatwingBertha.start_pos]
## and [member BatwingBertha.end_pos] to [member BatwingBertha.target_positions]
func _ready() -> void:
	# Set the motion mode to floating
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

	# Ensure start_pos and end_pos nodes are assigned
	if start_pos and end_pos:
		target_positions.append(start_pos.global_position)
		target_positions.append(end_pos.global_position)
	else:
		print("Error: Node2D nodes are not assigned properly.")
		return

## Called every physics frame to handle character movement and player input.
## Takes [param delta] for the elapsed time since the last physics frame.
func _physics_process(delta: float) -> void:
	if target_positions.size() > 0:
		# Calculate the direction to the current target and move the character.
		var direction = (target_positions[current_target] - global_position).normalized()
		global_position += direction * move_speed * delta

		# Check if the character has reached the target position.
		if global_position.distance_to(target_positions[current_target]) < 5:
			current_target = (current_target + 1) % target_positions.size()

## Deletes this BatwingBertha instance from the scene tree.
func kill_batwing_bertha():
	get_tree().queue_delete(self)
