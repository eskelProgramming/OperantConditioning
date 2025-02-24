extends Area2D

@export var level_to_load : Level


func _on_body_entered(body: Node2D) -> void:
	if body is Mac:
		LevelManager.load_level(level_to_load.level_id)
