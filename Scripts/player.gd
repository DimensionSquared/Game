extends CharacterBody3D



const SPEED = 30
const JUMP_VELOCITY = 80
var GRAVITY = ProjectSettings.get_setting("physics/3d/default_gravity") as float

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
	
	if is_on_floor() and Input.is_action_pressed("Move_left") or Input.is_action_pressed("Move_right"):
		$AnimatedSprite3D.play("Run-Start")

	else:
		$AnimatedSprite3D.play("default")
			#making sure z dosent change to lock into 2d
	velocity.z = 0

	move_and_slide()
		

func _on_animated_sprite_3d_animation_finished():
	$AnimatedSprite3D.play("Run")
	print("Run")
	
	
	
