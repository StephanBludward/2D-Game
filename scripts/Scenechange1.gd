extends Area2D




func _on_body_entered(body):
 
	if (body.name == "Owl"):
		get_tree().change_scene_to_file("res://Scenes/2place.tscn")
