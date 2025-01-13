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
	print(levels.size())
	unload_level()
	
	var level_data = get_level_data_by_id(level_id)
	
	if not level_data:
		return
		
	var level_path = "res://scenes/%s.tscn" % level_data.level_path
	print("Has level path: %s" % level_path)
	var level_res := load(level_path)
	
	if level_res:
		loaded_level = level_res.instantiate()
		
		main_scene.add_child(loaded_level)
	else:
		print("level does not exist")
	
func get_level_data_by_id(id : int) -> LevelData:
	var level_to_return : LevelData = null
	print("id in get_level_data_by_id %s" % id)
	print(levels.size())	
	for lvl : LevelData in levels:
		print("level id: %s" % lvl.level_id)
		if lvl.level_id == id:
			level_to_return = lvl
			print(level_to_return)
			
	return level_to_return
