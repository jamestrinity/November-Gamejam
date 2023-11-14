extends StaticBody2D

var is_open = false
var animation_player : AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func toggle_door():
	if is_open:
		is_open = false
		animation_player.play("close_door_animation")  # Replace with your closing animation name
	else:
		is_open = true
		animation_player.play("open_door_animation")  # Replace with your opening animation name

func _on_lever_activated():
	toggle_door()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	$Button.connect("lever_activated", self, "_on_lever_activated")
	animation_player = $AnimationPlayer
