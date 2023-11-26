class_name SaveAndLoad extends Resource

@export var playerPosition: Vector2 = Vector2(50,50)
@export var level: String
func save() -> void:
	ResourceSaver.save(self, "user://savestate.tres")

static func load_or_create() -> SaveAndLoad:
	var res: SaveAndLoad = load("user://savestate.tres") as SaveAndLoad
	if !res:
		res = SaveAndLoad.new()
	return res


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
