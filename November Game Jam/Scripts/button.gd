extends StaticBody2D 

@onready var interaction_area = $Interaction_Area
@onready var sprite = $Sprite2D
@onready var door = get_node("door")
signal button_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	print("loaded")
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("pressed")
	Door.toggle_door();
	

