extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -700.0
@onready var sprite_2d = $Sprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "Jumping"
	else:
		sprite_2d.animation = "default"
			

	# Handle jump.
	if Input.is_action_just_pressed(" jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if Input.is_action_pressed("left"):
		velocity.x = direction * SPEED
		sprite_2d.flip_h = true
		sprite_2d.animation = "running"

	elif Input.is_action_pressed("right"):
		velocity.x = direction * SPEED
		sprite_2d.flip_h = false
	else:
		velocity.x = 0
		

	move_and_slide()
