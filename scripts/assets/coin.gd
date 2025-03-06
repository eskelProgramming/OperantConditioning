## coin.gd
## This script defines a Coin class, which represents a collectible coin in the game.
## Coins can be collected by a specific type of object (e.g., a character of type Mac).

## Declare this script as a Coin class
class_name Coin

## Extends Area2D, allowing the coin to detect overlapping objects
extends Area2D

## Determines whether the coin can currently be collected
@export var can_be_collected: bool = true

## Callback triggered when another body enters the coin's area
## Parameters:
##  body (Node2D): The body that entered the area
func _on_body_entered(body: Node2D) -> void:
	if body is Mac:
		collect_coin()

## Handles the logic for collecting the coin.
## Adds one coin to the CoinManager and marks the coin as collected
func collect_coin():
	if can_be_collected:
		CoinManager.add_coins(1)
		visible = false
		can_be_collected = false
