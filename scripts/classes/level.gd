class_name Level
extends Node

@export var level_id : int
@export var level_start_position : Node2D

var level_data : LevelData
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	level_data = LevelManager.get_level_data_by_id(level_id)
