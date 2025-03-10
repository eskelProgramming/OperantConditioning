## Handles interactions with the Main Menu scene. 
##
## When buttons are clicked in the scene, the interactions are 
## handled with the methods in this class. 

extends CanvasLayer

## The main scene to be loaded.
## @deprecated
const main_scene: PackedScene = preload('res://scenes/levels/test_level.tscn')

## The new game button.
## @deprecated
@onready var new_game = $menu/margin_container/inner_background/inner_container/button_container/Button

## The quit button.
## @deprecated
@onready var quit = $menu/margin_container/inner_background/inner_container/button_container4/Button

## Calls [method load_main_menu]
func _ready() -> void:
	load_main_menu()

## Connects signals to the buttons.
## @deprecated
func load_main_menu():
	new_game.connect('pressed', _on_new_game_pressed)
	quit.connect('pressed', _on_quit_pressed)
	
## Loads [Level] 1 and calls [method deactivate] to hide the 
## main menu.
func _on_new_game_pressed() -> void:
	LevelManager.load_level(1)
	deactivate()

## Quits out of the game.
func _on_quit_pressed() -> void:
	get_tree().quit()

## Hides the main menu and sets necessary processes to false. 
func deactivate() -> void:
	hide()
	set_process(false)
	set_physics_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)

## Shows the main menu and sets necessary processes to true. 
func activate() -> void:
	show()
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
