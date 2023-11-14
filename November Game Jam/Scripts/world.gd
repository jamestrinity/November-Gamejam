extends Node2D

var activeCharacter : int = 1
var characters : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# Add each character to the characters array
	for i in range(1, 4):
		characters.append(get_node("Character" + str(i)))
		characters[i - 1].active = false
		print(characters)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check for character switch input (e.g., a key press)
	if Input.is_action_just_pressed("switch_character"):
		print("swapped")
		switch_character()

func switch_character():
	# Deactivate the current character
	characters[activeCharacter - 1].active = false

	# Switch to the next character (loop back to 1 after 3)
	activeCharacter = (activeCharacter % 3) + 1

	# Activate the new character
	characters[activeCharacter - 1].active = true
