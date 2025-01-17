extends Node

var levels : Array[LevelData]

var main_scene : Node2D = null
var loaded_level : Level = null

func unload_level() -> void: 
	if is_instance_valid(loaded_level):
		loaded_level.queue_free()
	
	loaded_level = null
	
func load_level(level_id : int) -> void:
	print("Loading level: %s" % level_id)
	unload_level()
	
	var level_data = get_level_data_by_id(level_id)
	
	
	if not level_data:
		print("level_data is null")
		return
		
	var level_path = "res://scenes/levels/%s.tscn" % level_data.level_path
	var level_res := load(level_path)
	
	if level_res:
		print(loaded_level)
		loaded_level = level_res.instantiate()
		
		main_scene.add_child(loaded_level)
		print(loaded_level.level_data.level_name)
	else:
		print("level does not exist")
	
func get_level_data_by_id(id : int) -> LevelData:
	var level_to_return : LevelData = null
	print(levels.size())	
	for lvl : LevelData in levels:
		if lvl.level_id == id:
			level_to_return = lvl
			
	return level_to_return

func reset_levels() :
	for level in levels:
		level.level_completed = false
		level.level_unlocked = false
	get_level_data_by_id(1).level_unlocked = true
