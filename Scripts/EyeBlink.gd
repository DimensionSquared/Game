extends AnimatedSprite3D

var initposition = position

func _ready():
	null

func _process(_delta):
	#gets flip before running any flip comands
	var prevflip = flip_h
	#flips eyes if char flips left
	if Input.is_action_just_pressed("Move_left"):
		flip_h = true
	#flips eyes back if char flips right
	if Input.is_action_just_pressed("Move_right"):
		flip_h = false
	
	#checks if flip_h has changed from the value of prevflip
	#if it has changed then checks what it changed to then moves eyes to correct
	#-position
	if flip_h == prevflip:
		null
	elif flip_h == true:
		position.x = -4
	elif flip_h == false:
		position.x = -3

#moves eyes back to idle position
	if Input.is_action_just_released("Move_left") and flip_h == true:
		position = initposition
		position.x = -4.1
	if Input.is_action_just_released("Move_right") and flip_h == false:
		position = initposition
		


#when eye idle animation loops rolls number between 0 and 5, if 5 plays blink anim
func _on_animation_looped() -> void:
	var rand = randi_range(0, 5)
	if rand == 3:
		self.play("Blink")


#when blink plays, plays idle eyes anim
func _on_animation_finished():
	self.play("NoBlink")
