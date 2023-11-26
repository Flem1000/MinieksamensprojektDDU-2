extends Sprite2D




@onready var keypad = $"Interactable area/Keypad"
@onready var label = $Label

func _ready():
	pass

func _process(delta):
	var expression = Expression.new()
	expression.parse("x + 3", ["x"])
	var result = expression.execute([int(keypad.display)])
	label.text = str(result)

