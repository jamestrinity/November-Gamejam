extends Node2D

var is_door_open = null
var door_position_initial : Vector2
var door_position_open : Vector2
var door_speed = 100  # Adjust the speed of the door movement here

# Called when the node enters the scene tree for the first time.
func _ready():
	# Store initial and open positions
	door_position_initial = position
	door_position_open = Vector2(door_position_initial.x, door_position_initial.y - 200)  # Adjust 100 to the distance the door should move


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(is_door_open)
	if is_door_open:
		while position.y > door_position_open.y:
			position.y -= door_speed * delta
	if !is_door_open:
		while position.y < door_position_initial.y:
			position.y += door_speed * delta

# Function to open or close the door based on its current state
func toggle_door():
	if is_door_open == null:
		is_door_open = true
	else:
		is_door_open = !is_door_open



