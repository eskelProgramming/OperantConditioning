class_name MagmaJimmy
extends CharacterBody2D

@export var mac : Mac
@export var speed : float = 30

var hit_count = 0

func _ready():
	check_and_get_mac()

func _physics_process(delta):
	check_and_get_mac()
	
	move()
		
func move() :
	if mac:
		var direction = (mac.global_position - global_position).normalized()
		velocity.x = direction.x * speed
		velocity.y = 60

		move_and_slide()

func add_hits(num_hits_to_add: int) :
	hit_count += num_hits_to_add
	
	var new_scale = Vector2(scale) + Vector2(.1, .1)
	scale = new_scale

func check_and_get_mac() :
	if (mac == null) :
		mac = get_tree().get_nodes_in_group("mac")[0]
