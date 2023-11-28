extends Control
var menuIsOpen = false

@onready var load = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("open_menu") and menuIsOpen == false and load.interacting == false:
		$CanvasLayer.show()
		menuIsOpen = true
		Global.escaping = true
	elif Input.is_action_just_pressed("open_menu") and menuIsOpen == true and load.interacting == false:
		$CanvasLayer.hide()
		menuIsOpen = false
		Global.escaping = false
	


func _on_save_pressed():
	for i in get_parent().instantitedScenes.size():
		var packedscene = PackedScene.new()
		packedscene.pack(get_parent().instantitedScenes[i])
		var scenePath = get_parent().instantitedScenePaths[i].trim_prefix("res://Rooms/")
		ResourceSaver.save(packedscene,("user://"+scenePath))
	var saveandload = SaveAndLoad.new()
	saveandload.instantitedScenePaths = get_parent().instantitedScenePaths
	saveandload.currentScenePath = get_parent().currentScenePath
	saveandload.keys = Global.keys
	saveandload.save()
	

func _on_quit_pressed():
	get_tree().quit()


func _on_continue_pressed():
	$CanvasLayer.hide()
	menuIsOpen = false




func _on_svarangivelse_pressed():
	$CanvasLayer/Quit.hide()
	$CanvasLayer/Svarangivelse.hide()
	$CanvasLayer/Save.hide()
	$CanvasLayer/Continue.hide()
	$CanvasLayer/svarsprite.show()
	$CanvasLayer/Back.show()
	
	

func _on_back_pressed():
	$CanvasLayer/Quit.show()
	$CanvasLayer/Svarangivelse.show()
	$CanvasLayer/Save.show()
	$CanvasLayer/Continue.show()
	$CanvasLayer/svarsprite.hide()
	$CanvasLayer/Back.hide()
