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
	var game = self.get_parent()
	self.queue_free()
	var world_scene = main_scene.instantiate()
	game.add_child(world_scene)
	
func _on_quit_pressed() -> void:
	get_tree().quit()
