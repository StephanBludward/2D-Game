extends Node



func _play_animation (_body):
	$text1.visible_ratio = 0
	print('show text')

func _on_area_2d_body_entered(_body):
	$AnimationPlayer.play("textani")
	
