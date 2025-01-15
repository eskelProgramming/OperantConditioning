class_name MagmaJimmy
extends CharacterBody2D

@export var mac : Mac
@export var speed : float

var can_move_left = true
var can_move_right = true

func _ready():
	pass

func _physics_process(delta):
	if mac:
		var direction = (mac.position - position).normalized()
		# Adjust movement based on area collision detection
		if direction.x < 0 and not can_move_left:
			velocity.x = 0
		elif direction.x > 0 and not can_move_right:
			velocity.x = 0
		else:
			velocity.x = direction.x * speed
		velocity.y = 60

		move_and_slide()
