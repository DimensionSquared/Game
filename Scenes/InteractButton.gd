extends Sprite3D


var is_entered = false
var is_interacted = false
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Interact") and is_entered == true:
		while transparency < 1:
			transparency += 0.1
			await get_tree().create_timer(0.001).timeout
		is_interacted = true

func _on_area_area_entered(area: Area3D) -> void:
	is_entered = true
	while transparency > 0:
		if is_interacted == true:
			break
		transparency -= 0.1
		await get_tree().create_timer(0.001).timeout
		
	
func _on_area_area_exited(area: Area3D) -> void:
	is_entered = false
	while transparency < 1:
		if is_interacted == true:
			break
		transparency += 0.1
		await get_tree().create_timer(0.001).timeout
		
