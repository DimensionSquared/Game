extends Camera3D

@export var target_path: NodePath
@export var offset: Vector3 = Vector3(0, 0, 30)
@export var follow_speed: float = 5

var target: Node3D


func _ready():
	if target_path != null:
		target = get_node(target_path)

func _physics_process(delta: float) -> void:
	if target == null:
		return
		
	var desired_pos = target.global_transform.origin + offset
	global_position = global_position.lerp(desired_pos, delta * follow_speed)
