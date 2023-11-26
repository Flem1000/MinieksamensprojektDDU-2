extends Node2D
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
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		


func _on_button_pressed():
	remove_child($Menu)
	changeScene("res://Rooms/SpawnVærelse.tscn")

func _on_button_2_pressed():
	get_tree().quit()


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://settings_menu.tscn")
	
func changeScene(destination):
	removeCurrentScene(currentScene)
	if !instantitedScenePaths.has(destination):
		var loadedScene = load(destination)
		currentScene = loadedScene.instantiate()
		call_deferred("add_child", currentScene)
		instantitedScenePaths.append(destination)
		instantitedScenes.append(currentScene)
		print("new scene")
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
	saveandload.playerPosition = Vector2(50,50)
	saveandload.save()
	remove_child($Menu)
	changeScene("res://Rooms/SpawnVærelse.tscn")
