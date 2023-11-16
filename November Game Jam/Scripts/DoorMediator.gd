extends Node


var door_ref

func _init():
	door_ref = null

func set_door_reference(door):
	door_ref = door

func toggle_door():
	if door_ref:
		door_ref.toggle_door()
