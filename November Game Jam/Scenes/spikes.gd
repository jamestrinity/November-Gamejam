extends Node2D
class_name spikes


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		print("spiked")
		area.get_parent().die()
