extends AnimatedSprite3D



func _process(_delta):
	var direction = Input.get_axis("Move_left","Move_right")
	
	
	if direction == -1:
		flip_h = true
	if direction == 1:
		flip_h = false
	
	if Input.is_action_pressed("Move_left") and Input.is_action_pressed("Move_right"):
		pass
	
