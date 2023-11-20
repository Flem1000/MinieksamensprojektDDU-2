extends Node2D

@onready var fadeanim = $CanvasLayer/black_box/AnimationPlayer

func _on_door_body_entered(body):
	$doortimer.start()


func _on_doortimer_timeout():
	get_tree().change_scene_to_file("res://stuen.tscn")
