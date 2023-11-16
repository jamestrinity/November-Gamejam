extends StaticBody2D 

@onready var interaction_area = $Interaction_Area
@onready var sprite = $Sprite2D
@onready var door = get_node("door")
var mediator_ref
signal button_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	print("loaded")
	mediator_ref = get_node("/root/DoorMediator") # Access the autoloaded mediator
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if mediator_ref:
		mediator_ref.toggle_door()
	else:
		print("Mediator reference not found.")
	

