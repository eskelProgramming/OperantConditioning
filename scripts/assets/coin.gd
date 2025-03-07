## Represents a collectible coin in the game.
##
## Coins can be collected by either [Mac] or a [Wrench].
## Coins are tracked by the [CoinManager].
class_name Coin

# Inherits from [Area2D]
extends Area2D

## Determines whether the coin can currently be collected.
@export var can_be_collected: bool = true

## Checks if [param body] is [Mac]. If it is, [method collect_coin]
## is called. 
func _on_body_entered(body: Node2D) -> void:
	if body is Mac:
		collect_coin()

## Adds one coin to the CoinManager and marks the coin as collected.
func collect_coin():
	if can_be_collected:
		CoinManager.add_coins(1)
		visible = false
		can_be_collected = false
