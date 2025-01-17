extends Node

var lives : int = 5

func add_lives(num_lives_to_add : int): 
	lives += num_lives_to_add

func remove_lives(num_lives_to_remove : int):
	lives -= num_lives_to_remove
	check_lives()

func check_lives():
	if lives <= 0:
		game_over()

func game_over():
	lives = 5
	CoinManager.reset_coins()
	LevelManager.reset_levels()
	get_tree().change_scene_to_file("res://ui/scenes/game_over.tscn")
