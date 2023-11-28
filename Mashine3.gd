extends Sprite2D




@onready var keypad = $"Interactable area/Keypad"
@onready var label = $Label
@onready var wall_3 = $"../wall3"


func _ready():
	pass

func _process(delta):
	var expression = Expression.new()
	expression.parse("(x / 2) + 12.5", ["x"])
	var result = expression.execute([float(keypad.display)])
	if keypad.display != "":
		label.text = str(result)
	else:
		label.text = ""
	if keypad.display == keypad.correctAnswer and keypad.solved == false:
		wall_3.queue_free()
		keypad.solved = true
