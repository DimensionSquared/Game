extends AnimatedSprite3D



func _process(_delta):
	if Input.is_action_just_pressed("Move_left"):
		flip_h = true
		if flip_h == true:
			position.x = -4.2

	if Input.is_action_just_pressed("Move_right"):
		flip_h = false
		if flip_h == false:
			position.x = -2.8
			
func _on_animation_looped() -> void:
	var rand = randi_range(0, 5)
	if rand == 3:
		print("sucess")
		self.play("Blink")



func _on_animation_finished():
	print("done")
	self.play("NoBlink")
