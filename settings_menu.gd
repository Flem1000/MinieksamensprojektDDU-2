extends Node2D


func ready():
	Sound.menu_music.play()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menu.tscn")


func _on_fullscreen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if button_pressed == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)



func _on_video_pressed():
	$Video.hide()
	$Audio.hide()
	$Back.hide()
	$Videos.show()


func _on_audio_pressed():
	$Video.hide()
	$Audio.hide()
	$Back.hide()
	$Audios.show()


func _on_backtomain_pressed():
	$Video.show()
	$Audio.show()
	$Back.show()
	$Videos.hide()


func _on_backtomain_2_pressed():
	$Video.show()
	$Audio.show()
	$Back.show()
	$Audios.hide()


