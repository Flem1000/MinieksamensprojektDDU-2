extends Control


@export var correctAnswer: Array
var inputField : LineEdit
@onready var feedbackLabel = $Label
var solved = false

func _ready():
	inputField = $LineEdit
	feedbackLabel = $Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_submitted(text):
	if correctAnswer.has(text) and solved == false:
		feedbackLabel.text = "Korrekt!"
		get_owner().puzzle_solved()
		solved = true
	elif solved == false:
		feedbackLabel.text = "Forkert, prøv igen"
		inputField.text = ""
	else:
		feedbackLabel.text = "Du har allerede løst denne opgave"
