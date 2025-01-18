extends Control

@onready var mac = $"../../"

func _on_continue_pressed() -> void:
	mac.pause_menu_toggle()


func _on_restart_pressed() -> void:
	LevelManager.restart()
	mac.pause_menu_toggle()


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/scenes/main_menu.tscn")
