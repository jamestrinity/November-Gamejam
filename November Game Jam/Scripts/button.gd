extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Button_body_entered(body):
	if body.name == "Player":  # Replace "Player" with the name of the object that triggers the interaction
		emit_signal("lever_activated")  # Signal to inform the door that the lever/button is activated# Signal to inform the door that the lever/button is activated
