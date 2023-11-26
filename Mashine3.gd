extends Sprite2D




@onready var keypad = $"Interactable area/Keypad"
@onready var label = $Label
@onready var wall_3 = $"../wall3"


func _ready():
	pass

func _process(delta):
	var expression = Expression.new()
	expression.parse("(x + 3) * 2", ["x"])
	var result = expression.execute([int(keypad.display)])
	label.text = str(result)
	if keypad.display == keypad.correctAnswer and keypad.solved == false:
		wall_3.queue_free()
		keypad.solved = true
