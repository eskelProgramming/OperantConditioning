## Represents a single GoalPost object. 
##
## When [Mac] passes through, the next level is loaded. 
class_name GoalPost

extends Area2D

## The next level to load. Set in the editor. 
@export var level_id_to_load : int

## If [Mac] passes through the area, [method LevelManager.load_level]
## is called and [member level_id_to_load] is passed as the value. 
func _on_body_entered(body: Node2D) -> void:
	if body is Mac:
		LevelManager.load_level(level_id_to_load)
