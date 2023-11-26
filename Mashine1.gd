extends Sprite2D



@onready var keypad = $"Interactable area/Keypad"
@onready var label = $Label


func _ready():
	pass

func _process(delta):
	label.text = keypad.display
