class_name Bully
extends CharacterBody2D

@export var mac : Mac

var hit_count = 0

func _physics_process(delta: float) -> void:
	check_and_get_mac()
		
	if mac.global_position.distance_to(global_position) < 400:
		rush()
	else:
		velocity = Vector2.ZERO

func rush():
	var direction = (mac.global_position - global_position).normalized()
	velocity.x = direction.x * 100
	velocity.y = 60

	move_and_slide()

func add_hits(num_hits_to_add: int):
	hit_count += num_hits_to_add
	check_hit_count()
	
func check_hit_count():
	if hit_count >= 3:
		get_tree().queue_delete(self)

func check_and_get_mac() :
	if (mac == null) :
		mac = get_tree().get_nodes_in_group("mac")[0]
