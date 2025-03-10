## An enemy that can collide with [Mac].
##
## [MagmaJimmy] slowly moves towards [Mac]. When [MagmaJimmy] is hit
## by a wrench, he grows slightly instead of dying. 
class_name MagmaJimmy

# Inherits from CharacterBody2D
extends CharacterBody2D

## A reference to [Mac]
@export var mac : Mac
## The speed at which [MagmaJimmy] moves towards [Mac].
@export var speed : float = 30

## The number of times [MagmaJimmy] has been hit by [Wrench]es.
var hit_count = 0

## Calls [method check_and_get_mac] on load to make sure [member mac]
## is initialized. 
func _ready():
	check_and_get_mac()

## Calls [method check_and_get_mac] and then calls [method move] every
## frame. 
func _physics_process(delta):
	check_and_get_mac()
	
	move()

## Gets the direction to get towards [Mac] by subtracting global_position
## from Mac.global_position normalized. This is used for direction.
## velocity.x is set to direction.x * speed do decide which direction to move. 
## velocity.y is set to 60 to act as gravity. 
## [method CharacterBody2D.move_and_slide] is called. 
func move() :
	if mac:
		var direction = (mac.global_position - global_position).normalized()
		velocity.x = direction.x * speed
		velocity.y = 60

		move_and_slide()

## Adds [param num_hits_to_add] to [member hit_count] and scales 
## up by .1 and .1.
func add_hits(num_hits_to_add: int) :
	hit_count += num_hits_to_add
	
	var new_scale = Vector2(scale) + Vector2(.1, .1)
	scale = new_scale

## Checks if [member mac] is null, and if it is gets [Mac] out of the 
## out of the "mac" group. 
func check_and_get_mac() :
	if (mac == null) :
		mac = get_tree().get_nodes_in_group("mac")[0]
