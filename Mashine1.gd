extends Sprite2D



@onready var keypad = $"Interactable area/Keypad"
@onready var label = $Label

@onready var display = int(keypad.display)

func _ready():
	pass

func _process(delta):
	var expression = Expression.new()
	expression.parse("2+3")
	var result = expression.execute()
	if result != null:
		label.text = result
		print(result)
