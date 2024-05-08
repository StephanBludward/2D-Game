extends CanvasLayer 
func _physics_process(delta):
	%Label.text = "Apples: "  + str(Globals.apple_count)
	
