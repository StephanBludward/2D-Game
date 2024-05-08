extends Area2D

@export var target_level : PackedScene 


func _on_body_entered(body):
	
	if (body.name == "CharacterBody2D"):
		get_tree().change_scene_to_file("res://Scenes/Win_scene.tscn")


func _on_scene_objects_replacing_by(node):
	pass # Replace with function body.
