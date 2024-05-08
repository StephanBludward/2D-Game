extends CharacterBody2D

var speed = 35
var health = 100
var damage
var on_floor = is_on_floor()
var dead = false
var player_in_area = false
var player
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	dead = false
func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
	if !dead:
		$detection_area/CollisionShape2D.disabled = false
		if player_in_area:
			position += (player.position - position) / speed 
			$AnimatedSprite2D.play("Walk")
		else:
			$AnimatedSprite2D.play("Idle")
			
	if dead:
		$detection_area/CollisionShape2D.disabled = true
		$AnimatedSprite2D.play("Death")
	move_and_slide()
func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_area = true
		

func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		player = body	
func _on_punch_area_entered(area):
	var damage
	
	print ("bat")
	if area.has_method("punch_deal_damage"):
		damage = 100
		take_damage(damage)
		
func take_damage(damage):
	
	health = health - damage
	if health <= 0 and !dead:
		death()
	
func death():
	dead = true
	$AnimatedSprite2D.play("Death")
	await get_tree().create_timer(1).timeout
	queue_free()
	
	
	
	
	
