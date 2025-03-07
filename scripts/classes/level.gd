## The basic information required for a playable Level.
##
## This Script is attached to each level scene. Keeps track of basic info for 
## each level. 
class_name Level

# inherits from node
extends Node

## The unique ID for the level. Set in the editor. 
@export var level_id : int
## The start posistion for [Mac]. Defines where [Mac] loads in. 
## Set in the editor. 
@export var level_start_position : Node2D

## Extra information is stored in [member LevelData].
var level_data : LevelData
func _ready() -> void:
	level_data = LevelManager.get_level_data_by_id(level_id)
