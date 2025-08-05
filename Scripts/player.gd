extends CharacterBody3D



var SPEED = 0
const JUMP_VELOCITY = 80
var GRAVITY = ProjectSettings.get_setting("physics/3d/default_gravity") as float
#ditects if started or stopped moving
var direction_changed = false
var direction = 0


	
func _physics_process(delta: float) -> void:
	#collecting input dir
	var direction2 = direction
	direction = Input.get_axis("Move_left","Move_right")
	var rightmarker = $AnimatedSprite3D/RunningR.global_position
	var leftmarker = $AnimatedSprite3D/RunningL.global_position
	
	if direction * direction != direction2 * direction2:
		direction_changed = true 
		print("ok")
	else:
		direction_changed = false
		
	
	
	# Gravity
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	# Jumping
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#speeding up character gradually after starting
	if direction != 0:
		if SPEED < 25:
			SPEED += 2
			
	#slowing down character gradually after stopping
	if direction == 0:
		if SPEED > 0:
			SPEED -= 2
			
			if SPEED < 0:
				SPEED = 0
			
	#actually moving the character
	velocity.x = direction * SPEED

	#starts run or plays idle when stopped
	if direction_changed == true:
		if direction == 1 or -1:
			$AnimatedSprite3D.play("Run-Start")
			print("Run-start")
		if direction == 0:
			$AnimatedSprite3D.play("default")
	
	
	if is_on_floor():
		
		if Input.is_action_pressed("Move_left"):
			$Eyeanim.global_position = leftmarker
		elif Input.is_action_pressed("Move_right"):
			$Eyeanim.global_position = rightmarker
			
	#making sure z dosent change to lock into 2d
	velocity.z = 0
	
	
	move_and_slide()
	
#plays run when run start is finished
func _on_animated_sprite_3d_animation_finished():
	if direction_changed == false:
		$AnimatedSprite3D.play("Run")
		print("Run")
	
	
