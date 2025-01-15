extends CharacterBody2D

@export var mac : Mac
@export var speed : float
@export var navigation_agent : NavigationAgent2D
@export var navigation_region : NavigationRegion2D
@export var ray_left : RayCast2D
@export var ray_right : RayCast2D

func _ready():
	navigation_agent.set_navigation_map(navigation_region)

func _physics_process(delta):
	if mac:
		navigation_agent.set_target_position(mac.global_position)
		if not navigation_agent.is_navigation_finished():
			var direction = (navigation_agent.get_next_path_position() - global_position).normalized()
			velocity = direction * speed
			print("Velocity: ", velocity)
			check_edges()
		move_and_slide()

func check_edges():
	ray_left.force_raycast_update()
	ray_right.force_raycast_update()
	print("Ray Left Colliding: ", ray_left.is_colliding())
	print("Ray Right Colliding: ", ray_right.is_colliding())
	if ray_left.is_colliding() or ray_right.is_colliding():
		velocity = Vector2.ZERO  # Stop moving if an edge is detected
		print("Edge detected, stopping movement")
	else:
		print("No edge detected, continuing movement")
