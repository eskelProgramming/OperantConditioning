extends Node

var coins : int = 0

func add_coins(num_coins_to_add : int) :
	coins += num_coins_to_add
	if coins > 100:
		var lives_to_add = (coins / 100) % 10
		remove_coins(lives_to_add * 100)
		LifeManager.add_lives(lives_to_add)
	
func remove_coins(num_coins_to_remove : int) :
	coins -= num_coins_to_remove

func reset_coins():
	coins = 0
