extends Node
func _ready():
	Globals.apple_count = 6
func _process(delta):
	if Globals.apple_count == 0:
		get_tree().change_scene_to_file("res://Scenes/Blue_cave.tscn")

