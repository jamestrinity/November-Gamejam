extends Node2D

@export var speed = 10s60
var current_speed = 0.0


func _physics_process(delta):
	position.y += current_speed * delta

func _on_hitbox_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().die()


func _on_player_detector_area_entered(area):
	fall()
	
func fall():
	current_speed = speed
	
