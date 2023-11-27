class_name SaveAndLoad extends Resource
@export var keys: int
@export var instantitedScenePaths: Array
@export var currentScenePath: String
func save() -> void:
	ResourceSaver.save(self, "user://savestate.tres")

static func load_or_create() -> SaveAndLoad:
	var res: SaveAndLoad = load("user://savestate.tres") as SaveAndLoad
	if !res:
		res = SaveAndLoad.new()
	return res
