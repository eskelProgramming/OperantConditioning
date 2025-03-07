## An enemy that can collide with [Mac].
##
## When [Mac] comes within 400 units of Bully, [method rush] is called.
## If [Mac] collides with [Bully], [method Mac.reset_mac] is called. 
class_name Bully

# inherits from CharacterBody2d
extends CharacterBody2D

## A reference to [Mac] for tracking.
@export var mac : Mac

## Keeps track of the number of times that [Bully] has been hit. 
var hit_count : int = 0

## Called every frame to check if mac is within range. If he is, 
## [method rush] is called. Otherwise, stay still. 
func _physics_process(delta: float) -> void:
	check_and_get_mac()
		
	if mac.global_position.distance_to(global_position) < 400:
		rush()
	else:
		velocity = Vector2.ZERO

## Moves rapidly in the direction of [Mac]
func rush():
	var direction = (mac.global_position - global_position).normalized()
	velocity.x = direction.x * 100
	velocity.y = 60

	move_and_slide()

## Adds [param num_hits_to_add] to [member hit_count] and calls
## [method check_hit_count]
func add_hits(num_hits_to_add: int):
	hit_count += num_hits_to_add
	check_hit_count()
	
## If [member hit_count] is greater than or equal to 3, delete self. 
func check_hit_count():
	if hit_count >= 3:
		get_tree().queue_delete(self)

## If [member mac] is null, get [Mac] out of the group and assign 
## it to [member mac].
func check_and_get_mac() :
	if (mac == null) :
		mac = get_tree().get_nodes_in_group("mac")[0]
