extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_VELOCITY
		

	# Get the input riktning: -1, 0, 1
	var riktning = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if riktning > 0:
		animated_sprite.flip_h = true
	elif riktning < 0:
		animated_sprite.flip_h = false
	
	# Play animations
	if is_on_floor():
		if riktning == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement
	if riktning:
		velocity.x = riktning * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
