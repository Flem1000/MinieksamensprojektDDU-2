extends Node2D
class_name  interactableUI

# Called when the node enters the scene tree for the first time.

func _on_close_button_pressed():
	get_parent().not_interacting()
	get_child(0).hide()
	
