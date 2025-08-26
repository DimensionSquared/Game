extends CharacterBody3D



var SPEED = 0
const JUMP_VELOCITY = 80
var GRAVITY = ProjectSettings.get_setting("physics/3d/default_gravity") as float
#ditects if started or stopped moving
var direction_changed = false
var direction = 0
var is_full_running = false



var footstep_sounds: Array = [
	preload("res://assets/Audio/Sound FX/Footsteps/Footsteps1.wav"),
	preload("res://assets/Audio/Sound FX/Footsteps/Footsteps2.wav"),
	preload("res://assets/Audio/Sound FX/Footsteps/Footsteps3.wav"),
	preload("res://assets/Audio/Sound FX/Footsteps/Footsteps4.wav"),
	preload("res://assets/Audio/Sound FX/Footsteps/Footsteps5.wav"),
	preload("res://assets/Audio/Sound FX/Footsteps/Footsteps6.wav"),
	preload("res://assets/Audio/Sound FX/Footsteps/Footsteps7.wav"),
	preload("res://assets/Audio/Sound FX/Footsteps/Footsteps8.wav")
]

var soundplayer: AudioStreamPlayer3D
	
func _ready() -> void:
	randomize()
	soundplayer = $AnimatedSprite3D/AudioStreamPlayer3D
	
	
func _physics_process(delta: float) -> void:
	#collecting input dir
	var direction2 = direction
	direction = Input.get_axis("Move_left","Move_right")
	var rightmarker = $AnimatedSprite3D/RunningR.global_position
	var leftmarker = $AnimatedSprite3D/RunningL.global_position
	
	if direction * direction != direction2 * direction2:
		direction_changed = true 
		
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
		if direction == 1 or -1 and is_full_running == false:
			$AnimatedSprite3D.play("Run-Start")
			
			
		if direction == 0:
			$AnimatedSprite3D.play("default")
	
	if Input.is_action_just_released("Move_left"):
		is_full_running = false
	if Input.is_action_just_released("Move_right"):
		is_full_running = false
	
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
		is_full_running = true
	
	
	


func _on_animated_sprite_3d_frame_changed() -> void:
	if $AnimatedSprite3D.frame == 4 or $AnimatedSprite3D.frame == 9:
		if direction != 0:
			print(direction)
			var random_sound = randi() % footstep_sounds.size()
			soundplayer.stream = footstep_sounds[random_sound]
			soundplayer.play()
