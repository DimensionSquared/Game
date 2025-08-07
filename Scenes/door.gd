extends Sprite3D

var in_radius = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_radius == true and Input.is_action_just_pressed("Interact"):
		while transparency < 1:
			transparency += 0.1
			$SpotLight3D2.light_energy += 0.25
			await get_tree().create_timer(0.001).timeout


func _on_area_area_entered(area: Area3D) -> void:
	in_radius = true
		


func _on_area_area_exited(area: Area3D) -> void:
	in_radius = false
