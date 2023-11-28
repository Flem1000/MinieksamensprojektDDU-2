extends Node2D
@onready var label = get_node("tutorialText")
@onready var timer = get_node("tutorialTimer")
@onready var player = $"../Player"
var continueTut = false
# Called when the node enters the scene tree for the first time.
func _ready():
	starttutorial()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.velocity.x != 0 and continueTut == true or player.velocity.y != 0 and continueTut == true:
		label.text = "Tryk Q for at interagere! Prøv at interagere med reolen over dig"
		continuetutorial()
	print(player.global_position.y)

func starttutorial():
	label.text = "Velkommen til MafCat!"
	timer.start(4)
	


func _on_tutorial_timer_timeout():
	print("timer done")
	label.text = "Brug WASD for at bevæge dig"
	timer.stop()
	continueTut = true
	

func continuetutorial():
	if player.global_position.y < ($"../Interactable area".global_position.y+20) and player.interacting:
		label.text = ""
		continueTut = false
		$"../blockade".queue_free()
