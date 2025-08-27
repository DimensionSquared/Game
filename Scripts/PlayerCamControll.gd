extends Camera3D

@export var target_path: NodePath
@export var offset: Vector3 = Vector3(0, 0, 30)
@export var follow_speed: float = 5
var rand_shake_x = 0
var rand_shake_y = 0
var released = false
var target: Node3D
var timer = Timer.new()
var shake = 0
var shakebefore = 0
var timer2 = 0


func _ready():
	if target_path != null:
		target = get_node(target_path)
	add_child(timer)
	timer.one_shot = true

func _physics_process(delta: float) -> void:
	if target == null:
		return
	timer.wait_time = 1
	var desired_pos = target.global_transform.origin + offset
	global_position = global_position.lerp(desired_pos, delta * follow_speed)
	rand_shake_x = randf_range(-0.5, 0.5)
	rand_shake_y = randf_range(-1.5, 0.5)
	
	
	if shakebefore - shake == -1:
		position.x += rand_shake_x
		position.y += rand_shake_y
		timer.start()
	
	position.x += rand_shake_x * timer.time_left
	position.y += rand_shake_y * timer.time_left
	
	
	shakebefore = shake


func _on_area_3d_3_area_exited(area: Area3D) -> void:
	var timer2 = get_parent().get_node("Timer2")
	timer2.start()


func _on_timer_2_timeout() -> void:
	shake = 1
