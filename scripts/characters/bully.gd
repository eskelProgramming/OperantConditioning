class_name Bully
extends CharacterBody2D

@export var mac : Mac

func _physics_process(delta: float) -> void:
	if mac.global_position.distance_to(global_position) < 400:
		rush()
	else:
		velocity = Vector2.ZERO

func rush():
	var direction = (mac.global_position - global_position).normalized()
	velocity.x = direction.x * 100
	velocity.y = 60

	move_and_slide()
