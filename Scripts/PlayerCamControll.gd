extends Camera3D

@export var target_path: NodePath
@export var offset: Vector3 = Vector3(0, 0, 30)
@export var follow_speed: float = 5
var rand_shake_x = 0
var rand_shake_y = 0
var released = false
var target: Node3D
var timer = Timer.new()


func _ready():
	if target_path != null:
		target = get_node(target_path)
	add_child(timer)
	timer.one_shot = true

func _physics_process(delta: float) -> void:
	if target == null:
		return
	timer.wait_time = 0.5
	var desired_pos = target.global_transform.origin + offset
	global_position = global_position.lerp(desired_pos, delta * follow_speed)
	rand_shake_x = randf_range(-0.5, 0.5)
	rand_shake_y = randf_range(-2, 0.5)
	
	
	if Input.is_action_pressed("Interact"):
		position.x += rand_shake_x
		position.y += rand_shake_y
	
	if Input.is_action_just_released("Interact"):
		timer.start()
	
	position.x += rand_shake_x * timer.time_left
	position.y += rand_shake_y * timer.time_left

		
	
	
