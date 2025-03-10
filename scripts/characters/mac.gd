## The main character of Operant Conditioning. 
##
## [Mac] takes in player input to move left, right, jump, slow engine time
## and throw [Wrench]es one at a time. When the player collides with an enemy,
## [method Mac.reset_mac] is called.
class_name Mac

# Inherits from [CharacterBody2D]
extends CharacterBody2D

## Controls the speed at which [Wrench]es are thrown. Can be manipulated
## in the editor. 
@export var throw_speed : float

## A reference to a [PauseMenu] to allow [PauseMenu] interactions. 
@onready var pause_menu: PauseMenu = $Camera2D/pause_menu

## The left and right speed of [Mac]
const SPEED : float = 250.0
## The jump velocity of [Mac]. A negative in Godot on the y axis is up. 
const JUMP_VELOCITY : float = -350.0

## Used to determine if [Mac] can recieve movement input.
var can_control : bool = true
## Used for keeping track of if the player is slowing engine time.
var is_slowing_time : bool = false
## True if the [PauseMenu] is currently on screen.
var is_paused : bool = false
## Used to limit back-to-back [Wrench] throws. 
var can_throw : bool = true

## Hide the [PauseMenu] on load. 
func _ready() -> void:
	pause_menu.hide()

## Controls player input for movement, throwing [Wrench]es, 
## slowing engine time, and toggling [PauseMenu].
func _physics_process(delta: float) -> void:
	if not can_control: return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("slow_time"):
		is_slowing_time = true
		Engine.time_scale = 0.5  # Slow down time
	elif Input.is_action_just_released("slow_time"):
		is_slowing_time = false
		Engine.time_scale = 1.0  # Restore normal time

	if Input.is_action_just_pressed("throw"):
		if can_throw: 
			throw_wrench()
			can_throw = false
			await get_tree().create_timer(.25).timeout
			can_throw = true

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_just_pressed("pause"):
		pause_menu_toggle()

## Hides or shows the [PauseMenu], stops or starts engine time. 
func pause_menu_toggle():
	if is_paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	is_paused = !is_paused

## Called when Mac collides with a [DangerZone]. Removes a life, 
## sets visible and can control to false, and calls [method LevelManager.restart()].
func handle_danger() -> void:
	LifeManager.remove_lives(1)
	visible = false
	can_control = false
	
	LevelManager.restart()

## Initializes a [Wrench] and launches it in the direction of the mouse. 
## a timer is started, and after it runs out the [Wrench] is deleted. 
func throw_wrench():
	var throw_instance = preload("res://scenes/assets/wrench.tscn").instantiate()
	get_parent().add_child(throw_instance)
	throw_instance.global_position = global_position
	var direction = (get_global_mouse_position() - global_position).normalized()
	throw_instance.linear_velocity = direction * throw_speed
	# Deletes the Wrench after 5 seconds. 
	await get_tree().create_timer(5).timeout
	get_tree().queue_delete(throw_instance)
