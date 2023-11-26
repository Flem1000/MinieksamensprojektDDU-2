extends Control
var player
var menuIsOpen = false
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
	var saveandload = SaveAndLoad.new()
	saveandload.playerPosition = $"..".global_position
	saveandload.save()
