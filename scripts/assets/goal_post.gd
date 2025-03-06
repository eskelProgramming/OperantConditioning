## Represents a single GoalPost object. When
## Mac passes through, the next level is loaded. 
class_name GoalPost

extends Area2D

@export var level_id_to_load : int


func _on_body_entered(body: Node2D) -> void:
	if body is Mac:
		LevelManager.load_level(level_id_to_load)
