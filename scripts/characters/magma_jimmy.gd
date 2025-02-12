class_name MagmaJimmy
extends CharacterBody2D

@export var mac : Mac
@export var speed : float

var can_move_left = true
var can_move_right = true
var hit_count = 0

func _ready():
	check_and_get_mac()

func _physics_process(delta):
	check_and_get_mac()
	
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

func add_hits(num_hits_to_add: int) :
	hit_count += num_hits_to_add
	
	var scale_to_add = Vector2(scale) + Vector2(.1, .1)
	scale = scale_to_add

func check_and_get_mac() :
	if (mac == null) :
		mac = get_tree().get_nodes_in_group("mac")[0]
