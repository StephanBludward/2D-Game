extends Node


var points = 0

@onready var points_label = %Label

func add_point():
	points += 1
	print (points)
	points_label.text = "Apples" + str(points)
