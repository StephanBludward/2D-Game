extends CharacterBody2D

const SPEED = 300.0
const JUMP_FORCE = -400.0


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var max_jumps = 2



func _physics_process(delta):
	print (is_on_floor())
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		jump_count = 0
	
	if Input.is_action_just_pressed("Jump") and jump_count < max_jumps:
		
		velocity.y = JUMP_FORCE
		jump_count += 1
		$AnimatedSprite2D.play("Jump")


	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("Idle")

	move_and_slide()
	



func player():
	pass

