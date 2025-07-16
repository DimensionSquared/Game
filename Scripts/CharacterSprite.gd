extends AnimatedSprite3D



func _process(_delta):
	if Input.is_action_just_pressed("Move_left"):
		flip_h = true
	if Input.is_action_just_pressed("Move_right"):
		flip_h = false
