extends AnimatedSprite3D



# Called when the node enters the scene tree for the first time.
func _ready():
	null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Move_left"):
		flip_h = true
	if Input.is_action_just_pressed("Move_right"):
		flip_h = false
