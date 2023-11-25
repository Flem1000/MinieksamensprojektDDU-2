extends Node2D
var save_path = "user://mafcat.save"
var playerposition
var level
@onready var Player = $"../../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playerposition = Player.global_position
	print(playerposition)
func save():
	var file = FileAccess.open(save_path,FileAccess.READ_WRITE)
	file.store_var(playerposition)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path,FileAccess.READ)
		playerposition = file.get_var(playerposition)
	else:
		print("no data saved")
	


func _on_save_pressed():
	call_deferred("save")

func _on_load_pressed():
	load_data()
