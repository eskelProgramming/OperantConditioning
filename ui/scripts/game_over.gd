## Appears after the Player dies. Has a button that returns the player to
## the [MainMenu]
extends Node

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/scenes/main.tscn")
