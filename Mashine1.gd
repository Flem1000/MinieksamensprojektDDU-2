extends Sprite2D



@onready var keypad = $"Interactable area/Keypad"
@onready var label = $Label
@onready var wall_1 = $"../wall1"


func _ready():
	pass

func _process(delta):
	var expression = Expression.new()
	expression.parse("x * 2", ["x"])
	var result = expression.execute([int(keypad.display)])
	if keypad.display != "":
		label.text = str(result)
	else:
		label.text = ""
	if keypad.display == keypad.correctAnswer and keypad.solved == false:
		wall_1.queue_free()
		keypad.solved = true
