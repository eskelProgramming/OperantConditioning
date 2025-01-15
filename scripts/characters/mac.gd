class_name Mac
extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0

var can_control : bool = true

func _physics_process(delta: float) -> void:
	if not can_control: return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		print(get_tree().current_scene)
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
	visible = false
	can_control = false
	
	await get_tree().create_timer(1).timeout
	reset_mac()
	
func reset_mac() -> void:
	global_position = LevelManager.loaded_level.level_start_position.global_position
	visible = true
	can_control = true
