extends AnimatedSprite3D




func _on_tree_fall_animation_finished() -> void:
	transparency = 0
	play("default")
