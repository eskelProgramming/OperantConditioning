extends CharacterBody2D

@export var start_pos : Node2D
@export var end_pos : Node2D
@export var move_speed : float

var is_at_start = true
var is_in_motion
var is_at_end = false

func move():
	if (is_at_start) :
		
