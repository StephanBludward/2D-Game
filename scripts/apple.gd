extends Area2D

@onready var apple_count = %apple_count


func _on_body_entered(body):
	if (body.name == "Owl"):
		Globals.apple_count -= 1
		queue_free()
		
