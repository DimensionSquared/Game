extends CharacterBody3D



const SPEED = 25
const JUMP_VELOCITY = 80
var GRAVITY = ProjectSettings.get_setting("physics/3d/default_gravity") as float




	
func _physics_process(delta: float) -> void:
	var rightmarker = $AnimatedSprite3D/RunningR.global_position
	var leftmarker = $AnimatedSprite3D/RunningL.global_position

	# Gravity
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	# Jumping
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	#collecting input dir
	var direction = Input.get_axis("Move_left","Move_right")
	velocity.x = direction * SPEED
	print(direction)

	
	if is_on_floor() and Input.is_action_just_pressed("Move_left") or Input.is_action_just_pressed("Move_right"):
		if direction == 1 or -1:
			$AnimatedSprite3D.play("Run-Start")
		
			
		if Input.is_action_pressed("Move_left"):
			$Eyeanim.global_position = leftmarker
		else:
			$Eyeanim.global_position = rightmarker
			
	
		
	if is_on_floor() and direction == 0:
		$AnimatedSprite3D.play("default")
		
	#making sure z dosent change to lock into 2d
	velocity.z = 0

	move_and_slide()
	#var playerlocation = self.Vector3
		


	


func _on_animated_sprite_3d_animation_finished() -> void:
	$AnimatedSprite3D.play("Run")
	print("ok")
