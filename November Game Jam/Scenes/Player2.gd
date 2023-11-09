extends CharacterBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -600.0
@export var active = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		print(velocity.y)
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and active:
		velocity.y = JUMP_VELOCITY
		print(velocity.y)

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if active: 
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	if not active:
		velocity.x = 0
	
	
	move_and_slide()

