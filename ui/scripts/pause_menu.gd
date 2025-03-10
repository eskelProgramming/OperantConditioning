## The game pause menu.
##
## Shows when the pause menu is toggled. Currently working options are resume, 
## restart, and exit to main menu. 
## @experimental
class_name PauseMenu

# Inherits from Control
extends Control

## A reference to [Mac]. 
## @deprecated
@onready var mac = $"../../"

## Calls [method Mac.pause_menu_toggle] to resume the game. 
func _on_continue_pressed() -> void:
	mac.pause_menu_toggle()

## Calls [method LevelManager.restart] and then calls
## [method Mac.pause_menu_toggle].
func _on_restart_pressed() -> void:
	LevelManager.restart()
	mac.pause_menu_toggle()

## Currently not functioning. 
## @experimental
func _on_options_pressed() -> void:
	pass # Replace with function body.

## Returns the player to the main menu. Work in progress. 
## @experimental
func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/scenes/main_menu.tscn")
