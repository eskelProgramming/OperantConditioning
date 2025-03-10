## Manages the Life count.

# Inherits from [Node].
extends Node

## The number of lives the Player has. Defaults to 5. 
var lives : int = 5

## Adds [param num_lives_to_add] to [member lives].
func add_lives(num_lives_to_add : int): 
	lives += num_lives_to_add

## Removes [param num_lives_to_remove] from [member lives]
## and calls [method check_lives].
func remove_lives(num_lives_to_remove : int):
	lives -= num_lives_to_remove
	check_lives()

## Checks if [member lives] is less than or equal to 0. If it is, 
## [method game_over] is called. 
func check_lives():
	if lives <= 0:
		game_over()

## Resets the lives, [Coins], [Level]s, and loads the Game Over scene.
func game_over():
	lives = 5
	CoinManager.reset_coins()
	LevelManager.reset_levels()
	get_tree().change_scene_to_file("res://ui/scenes/game_over.tscn")
