## Tracks the number of [Coin]s currently collected. 
##
## When there are 100 [Coin]s collected, [Coin]s are reset and a 
## Life is added to [LifeManager].
extends Node

## The current number of coins.
var coins : int = 0

## Add [param num_coins_to_add] to [member coins] and checks if
## [member coins] is greater that 100. If it is, remove the excess
## and add the number of lives to [LifeManager].
func add_coins(num_coins_to_add : int) :
	coins += num_coins_to_add
	if coins > 100:
		var lives_to_add = (coins / 100) % 10
		remove_coins(lives_to_add * 100)
		LifeManager.add_lives(lives_to_add)
	
## Removes [param num_coins_to_remove] from [member coins].
func remove_coins(num_coins_to_remove : int) :
	coins -= num_coins_to_remove

## Resets [member coins] to 0.
func reset_coins():
	coins = 0
