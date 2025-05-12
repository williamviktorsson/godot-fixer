extends CharacterBody2D

const SPEED = 130.0

# How high does bullmark students jump?
const JUMP_VELOCITY = 3000

# How quickly does bullmark students fall?
const GRAVITY = 98.2 

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the GRAVITY.
	if not is_on_floor():
		velocity.y += GRAVITY * 100 * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_VELOCITY
		

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	var go_left = direction > 0
	var go_right = direction < 0
	
	# I've thought about this for a long while. Perhaps someone younger
	# can figure it out...
	if go_left:
		face_right()
	elif go_right:
		face_left()
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func face_right():
	animated_sprite.flip_h = true
	
func face_left():
	animated_sprite.flip_h = false
