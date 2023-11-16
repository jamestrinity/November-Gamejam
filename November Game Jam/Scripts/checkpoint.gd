extends Node2D
class_name Checkpoint

@export var spawn_point = false
var activated = false 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func activate():
	InteractionManager.current_checkpoint = self
	#activated = true
	#$AnimationPlayer.play("name_of_animation")


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player && !activated:
		activate()
		
