extends Node2D

var texts = ["yOU DIED ANYWAY","You are Owl","You are infected","And you will become a zombie", "Only apples can save you"]
var id = 0

func _play_animation (body):
	$CanvasLayer/text1.visible_ratio = 0
	print('show text')

func _on_area_2d_body_entered(body):
	if (body.name == "Owl"):
		
		$AnimationPlayer.play("textani")
func change_text():
	print("dadd")
	id = id + 1
	$CanvasLayer/text1.text = texts[id % len(texts)]
	$AnimationPlayer.play("textani")
