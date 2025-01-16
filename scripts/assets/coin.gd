extends Area2D

@export var can_be_collected : bool = true

func _on_body_entered(body: Node2D) -> void:
	if body is Mac:
		if can_be_collected:
			CoinManager.add_coins(1)
			visible = false
			can_be_collected = false
