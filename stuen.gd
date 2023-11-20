extends Node2D



func _on_area_2d_body_entered(body):
	$doortimer.start()


func _on_doortimer_timeout():
	get_tree().change_scene_to_file("res://SpawnVærelse.tscn")


func _on_area_2d_2_body_entered(body):
	$doortimer2.start()


func _on_doortimer_2_timeout():
	get_tree().change_scene_to_file("res://gangen.tscn")
