extends CharacterBody3D


const SPEED = 20
const JUMP_VELOCITY = 200
var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity") as float

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	# Jumping
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#collecting input dir
	var direction = Input.get_axis("Move_left","Move_right")
	velocity.x = direction * SPEED
	
	#making sure z dosent change to lock into 2d
	velocity.z = 0

	move_and_slide()
