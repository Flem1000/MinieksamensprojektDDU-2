extends Node2D

@export var correctAnswer: Array
var display = ""

#
#Display
#

var display_0 = preload("res://Assets/UI/Keypad/Display0.png")
var display_1 = preload("res://Assets/UI/Keypad/Display1.png")
var display_2 = preload("res://Assets/UI/Keypad/Display2.png")
var display_3 = preload("res://Assets/UI/Keypad/Display3.png")
var display_4 = preload("res://Assets/UI/Keypad/Display4.png")
@onready var display_sprite = get_node("$CanvasLayer/Display")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func key_press(digit):
	if display.length() < 4:
		display + str(digit)
		update_texture()

func update_texture():
	if display.length() == 0:
		display_sprite.set_texture(display_0)
	elif display.length() == 1:
		display_sprite.set_texture(display_1)
	elif display.length() == 2:
		display_sprite.set_texture(display_2)
	elif display.length() == 3:
		display_sprite.set_texture(display_3)
	else:
		display_sprite.set_texture(display_4)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on__pressed():
	key_press(7)
