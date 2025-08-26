extends AnimatedSprite3D

var played = false


func _on_area_3d_area_exited(area: Area3D) -> void:
	if played == false:
		$Timer3.start()
		$AudioStreamPlayer3D.play()
	
func _on_timer_3_timeout() -> void:
	play("default")

func _on_animation_finished() -> void:
	play("new_animation")
	played = true
