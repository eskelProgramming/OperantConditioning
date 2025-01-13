
extends CanvasLayer

const main_scene: PackedScene = preload('res://scenes/test_level.tscn')

@onready var new_game = $menu/margin_container/inner_background/inner_container/button_container/Button
@onready var quit = $menu/margin_container/inner_background/inner_container/button_container4/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_main_menu()

func load_main_menu():
	new_game.connect('pressed', _on_new_game_pressed)
	quit.connect('pressed', _on_quit_pressed)
	
func _on_new_game_pressed() -> void:
	LevelManager.load_level(1)
	deactivate()
	
func _on_quit_pressed() -> void:
	get_tree().quit()

func deactivate() -> void:
	hide()
	set_process(false)
	set_physics_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)

func activate() -> void:
	show()
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
