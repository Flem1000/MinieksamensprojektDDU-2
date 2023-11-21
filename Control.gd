extends Control


@export var correctAnswer: Array
var inputField : LineEdit
@onready var feedbackLabel = $Label

func _ready():
	inputField = $LineEdit
	feedbackLabel = $Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_submitted(text):
	if correctAnswer.has(text):
		feedbackLabel.text = "Correct!"
	else:
		feedbackLabel.text = "Incorrect! Try again."
		inputField.text = ""
