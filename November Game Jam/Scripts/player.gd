extends CharacterBody2D


@export var active = true
@export var player = 0

var speed = 550
var jump_power = -2000

var acc = 50
const fricc = 70

const gravity = 120

var max_jumps = 2
var current_jumps = 1

func _ready():
	if player == 2:
		speed = 750
		max_jumps = 2
		acc = 70
	if player == 3:
		speed = 350
		max_jumps = 2
		acc = 40
		

func _physics_process(delta):
	var input_dir: Vector2 = input()

	if input_dir != Vector2.ZERO and active:
		acceleration(input_dir)
		player_animation()
	else:
		add_friction()
		player_animation()

	player_movement()
	
	jump()


func input() -> Vector2:
	var input_dir = Vector2.ZERO

	input_dir.x = Input.get_axis("move_left", "move_right")
	input_dir = input_dir.normalized()
	return input_dir

func acceleration(direction):
	velocity = velocity.move_toward(direction * speed, acc)

func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, fricc)

func player_movement():
	move_and_slide()

func jump():
	if Input.is_action_just_pressed("jump") and active:
		if current_jumps <max_jumps:
			velocity.y = jump_power
			if player == 1 or player == 3:
				max_jumps -= 1
			else: 
				current_jumps = current_jumps + 1
			
	else:
		velocity.y += gravity

	if is_on_floor():
		current_jumps = 1
		max_jumps = 2

func player_animation():
	pass
