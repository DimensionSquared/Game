extends Sprite3D


var is_entered = false
var is_interacted = false
#preloads next scene so game has a smooth transition
var game_scene = preload("res://LivingRoom.tscn").instantiate()
# Called every frame. 'delta' is the elapsed time since the previous frame.



func _process(_delta) -> void:
	if is_interacted == true and transparency == 1:
		get_tree().change_scene_to_file("res://LivingRoom.tscn")

func _input(_InputEvent) -> void:
	if Input.is_action_just_pressed("Interact") and is_entered == true:
		while transparency < 1:
			transparency += 0.1
			await get_tree().create_timer(0.001).timeout
		#records that the button has been pressed
		is_interacted = true
		

func _on_area_area_entered(_Area3D) -> void:
	#records when player is in button press zone
	is_entered = true
	while transparency > 0:
		if is_interacted == true:
			break
		transparency -= 0.1
		await get_tree().create_timer(0.001).timeout
		
	
func _on_area_area_exited(_Area3D) -> void:
	#records when player exits area
	is_entered = false
	while transparency < 1:
		if is_interacted == true:
			break
		transparency += 0.1
		await get_tree().create_timer(0.001).timeout
		
