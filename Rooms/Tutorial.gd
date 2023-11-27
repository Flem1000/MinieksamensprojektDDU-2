extends Node2D
@onready var label = self.get_node("tutorialText")
@onready var timer = self.get_node("tutorialTimer")
# Called when the node enters the scene tree for the first time.
func _ready():
	starttutorial()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func starttutorial():
	label.text = "Velkommen til MathCat!"
	add_child(timer)
	timer.wait_time = 5
	
	
	
