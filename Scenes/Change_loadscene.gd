extends Area3D


var next_scene = preload("res://Scenes/Forest.tscn").instantiate()

func _on_area_entered(_Area3D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/Forest.tscn")
	#add_child(next_scene)
#we will change this later to make sure we have two scenes loaded at the same time when doing scenes like-
#the vilage scene going to the forest scene
