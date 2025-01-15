extends CharacterBody2D

@export var mac : Mac
@export var speed : float
@export var navigation_agent : NavigationAgent2D
@export var navigation_region : NavigationRegion2D

func _ready():
	navigation_agent.set_navigation_map(navigation_region)

func _physics_process(delta):
	if mac:
		navigation_agent.set_target_position(mac.global_position)
		if not navigation_agent.is_navigation_finished():
			var direction = (navigation_agent.get_next_path_position() - global_position).normalized()
			velocity = direction * speed
			check_edges()
			move_and_slide()

func check_edges():
	var ray_left = $RayCast2D_Left
	var ray_right = $RayCast2D_Right
	ray_left.force_raycast_update()
	ray_right.force_raycast_update()
	if not ray_left.is_colliding() or not ray_right.is_colliding():
		velocity = Vector2.ZERO  # Stop moving if an edge is detected
