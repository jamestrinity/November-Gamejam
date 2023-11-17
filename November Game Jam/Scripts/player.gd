extends CharacterBody2D
class_name Player

@onready var sprite = $Sprite2D
@onready var camera = $Camera2D

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
	if active:
		camera.make_current()
		
	if Input.is_action_just_pressed("move_right") && active:
		sprite.set_flip_h(true)
	elif Input.is_action_just_pressed("move_left") && active:
		sprite.set_flip_h(false)
		
	var input_dir: Vector2 = input()

	if input_dir != Vector2.ZERO && active:
		acceleration(input_dir)
		player_animation()
	else:
		add_friction()
		player_animation()

	player_movement()
	
	jump()
	drop()
	
	if position.y > 1200 && active:
		die()

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
	if Input.is_action_just_pressed("jump") && active:
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

func drop():
	if Input.is_action_pressed("down") && active && is_on_floor():
		position.y += 5

func player_animation():
	pass
	
func set_active():
	InteractionManager.player_active = self
	
func die():
	InteractionManager.respawn_player(self)
