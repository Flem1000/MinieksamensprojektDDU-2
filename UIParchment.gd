extends interactableUI

var area = get_owner()
@export var text : String
@onready var label = $CanvasLayer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.1).timeout
	label.text = text
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



	
