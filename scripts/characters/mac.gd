class_name Mac
extends CharacterBody2D

@export var throw_speed : float

const SPEED = 250.0
const JUMP_VELOCITY = -350.0

var can_control : bool = true
var is_slowing_time = false

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
		throw_object()

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

func handle_danger() -> void:
	print("mac died")
	LifeManager.remove_lives(1)
	visible = false
	can_control = false
	
	await get_tree().create_timer(.1).timeout
	reset_mac()
	
func reset_mac() -> void:
	global_position = LevelManager.loaded_level.level_start_position.global_position
	visible = true
	can_control = true

func throw_object():
	var throw_instance = preload("res://scenes/assets/wrench.tscn").instantiate()
	get_parent().add_child(throw_instance)
	throw_instance.global_position = global_position
	var direction = (get_global_mouse_position() - global_position).normalized()
	throw_instance.linear_velocity = direction * throw_speed
	
	await get_tree().create_timer(5).timeout
	get_tree().queue_delete(throw_instance)
