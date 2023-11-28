extends Node2D
var currentScenePath: String
var ingamemenu = preload("res://ingameMenu.tscn")
@onready var ingamemenuinstance = ingamemenu.instantiate()
var scene0 = preload("res://Rooms/SpawnVærelse.tscn")
@onready var instance0 = scene0.instantiate()
var scene1 = preload("res://Rooms/stuen.tscn")
@onready var instance1 = scene1.instantiate()
var currentScene
var instantitedScenePaths: Array
var instantitedScenes: Array
func _ready():
	var save_and_load = SaveAndLoad.load_or_create()
	if !save_and_load.currentScenePath:
		$Menu/Continue.disabled = true
	

var interacting = false

#
#Keys
#

@onready var key_hud = $CanvasLayer/KeyHUD
var key_hud_1 = preload("res://Assets/Key/KeyHUD/KeyHUD1.png") 
var key_hud_2 = preload("res://Assets/Key/KeyHUD/KeyHUD2.png") 
var key_hud_3 = preload("res://Assets/Key/KeyHUD/KeyHUD3.png") 


func key_got():
	print("key got")
	key_hud.show()
	if Global.keys == 1:
		key_hud.set_texture(key_hud_1)
	elif Global.keys == 2:
		key_hud.set_texture(key_hud_2)
	elif Global.keys == 3:
		key_hud.set_texture(key_hud_3)
	else:
		key_hud.hide()

#
#Keys
#

func interact():
	if interacting == false:
		interacting = true
	else:
		interacting = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		


func _on_button_pressed():
	var save_and_load = SaveAndLoad.load_or_create()
	for scenePath in save_and_load.instantitedScenePaths:
		scenePath = scenePath.trim_prefix("res://Rooms/")
		var packedscene = load("user://"+scenePath)
		var instantiatedpackedscene = packedscene.instantiate()
		instantitedScenes.append(instantiatedpackedscene)
		instantitedScenePaths.append("res://Rooms/"+scenePath)
	Global.keys = save_and_load.keys
	if Global.keys >= 1:
		key_got()
	changeScene(save_and_load.currentScenePath)
	remove_child($Menu)

func _on_button_2_pressed():
	get_tree().quit()


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://settings_menu.tscn")
	
func changeScene(destination):
	removeCurrentScene(currentScene)
	currentScenePath = destination
	if !instantitedScenePaths.has(destination):
		var loadedScene = load(destination)
		currentScene = loadedScene.instantiate()
		call_deferred("add_child", currentScene)
		instantitedScenePaths.append(destination)
		instantitedScenes.append(currentScene)

		
	else:
		for i in instantitedScenePaths.size():
			if instantitedScenePaths[i] == destination:
				currentScene = instantitedScenes[i]
				call_deferred("add_child",(currentScene))
	
	
func removeCurrentScene(scene: Node):
	if currentScene:
		call_deferred("remove_child",(currentScene))


func _on_new_game_pressed():
	var saveandload = SaveAndLoad.new()
	saveandload.save()
	remove_child($Menu)
	changeScene("res://Rooms/SpawnVærelse.tscn")


