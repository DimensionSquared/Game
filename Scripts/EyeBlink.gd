extends AnimatedSprite3D

var initposition = position



func _process(_delta):
	#gets flip before running any flip comands
	var direction = Input.get_axis("Move_left","Move_right")
	var prevdirection = direction
	#flips eyes if char flips left
	if direction == -1:
		flip_h = true
		$OmniLight3D.position.y = 0.05
		$OmniLight3D2.position.y = 0.1
		
		
	#flips eyes back if char flips right
	if direction == 1:
		flip_h = false
		$OmniLight3D.position.y = 0.1
		$OmniLight3D2.position.y = 0.05
		
		
	#checking if direction has changed
	if direction == prevdirection:
		position.x += 0
	while direction == 0:
		if flip_h == false:
			position.x = -2.5
		if flip_h == true:
			position.x = -4.5
		break

#moves eyes back to idle position
	if direction == 0 and flip_h == true:
		position = initposition
		position.x = -4.1
	if direction == 0 and flip_h == false:
		position = initposition
		


#when eye idle animation loops rolls number between 0 and 5, if 5 plays blink anim
func _on_animation_looped() -> void:
	var rand = randi_range(0, 5)
	if rand == 3:
		self.play("Blink")
		

#when blink plays, plays idle eyes anim
func _on_animation_finished():
	self.play("NoBlink")
	
