extends Camera3D

@export var target_path: NodePath
@export var delay_time: float = 0.5





func _ready():
	null
#we probably want to get position of target, then move the camera to that position at a delay and only in x and y axis


func _process(_delta):
	#get current position of player
	var target_node = get_node("/root/Node3D/Player/")
	
	var pos : Vector3 = target_node.position
	
	await get_tree().create_timer(delay_time).timeout
	global_position = Vector3(pos.x,pos.y,32.423)
	
	
