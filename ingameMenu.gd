extends Control
var menuIsOpen = false
var parchment = "res://UIParchment.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("open_menu") and menuIsOpen == false:
		$CanvasLayer.show()
		menuIsOpen = true
	elif Input.is_action_just_pressed("open_menu") and menuIsOpen == true:
		$CanvasLayer.hide()
		menuIsOpen = false
	


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
	pass
