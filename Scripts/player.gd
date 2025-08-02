extends CharacterBody3D



var SPEED = 0
const JUMP_VELOCITY = 80
var GRAVITY = ProjectSettings.get_setting("physics/3d/default_gravity") as float




	
func _physics_process(delta: float) -> void:
	#collecting input dir
	var direction = Input.get_axis("Move_left","Move_right")
	var rightmarker = $AnimatedSprite3D/RunningR.global_position
	var leftmarker = $AnimatedSprite3D/RunningL.global_position
	
	# Gravity
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	# Jumping
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		
	#speeding up character gradually after starting
	
	while direction == 1 or -1:
		if SPEED >= 25:
			break
		else:
			SPEED += 1
			break
	
	
	#slowing down character gradually after stopping
	while direction == 0:
		if SPEED == 0:
			break
		else:
			SPEED -= 1
			break
			
	if SPEED >1:
		print(SPEED)
		
	velocity.x = direction * SPEED
	
	
	if direction == 1 or -1:
		$AnimatedSprite3D.play("Run-Start")
	
	
	if is_on_floor():
		
		if Input.is_action_pressed("Move_left"):
			$Eyeanim.global_position = leftmarker
		elif Input.is_action_pressed("Move_right"):
			$Eyeanim.global_position = rightmarker
			
	
		
	if is_on_floor() and direction == 0:
		$AnimatedSprite3D.play("default")
		
	#making sure z dosent change to lock into 2d
	velocity.z = 0

	move_and_slide()
	#var playerlocation = self.Vector3
		


	


func _on_animated_sprite_3d_animation_finished() -> void:
	$AnimatedSprite3D.play("Run")
	
