extends Camera3D

@export var target_path: NodePath
@export var smooth_speed: float = 5.0

var target: Node3D

func _ready():
	if target_path != null:
		target = get_node(target_path) as Node3D

func _process(delta):
	if target == null:
		return

	var desired_position = target.global_transform.origin
	var current_position = global_transform.origin
	
	desired_position.z = current_position.z

	# Smooth
	var new_position = current_position.lerp(desired_position, delta * smooth_speed)

	# Set the new camera transform
	global_transform.origin = new_position
