extends Node2D

@export var correctAnswer: String
var display = ""
var solved = false

#
#Display
#

var display_0 = preload("res://Assets/UI/Keypad/Display0.png")
var display_1 = preload("res://Assets/UI/Keypad/Display1.png")
var display_2 = preload("res://Assets/UI/Keypad/Display2.png")
var display_3 = preload("res://Assets/UI/Keypad/Display3.png")
var display_4 = preload("res://Assets/UI/Keypad/Display4.png")
@onready var display_sprite = get_child(0).get_child(13)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func key_press(digit):

	if display.length() < 4 and solved == false:
		display += str(digit)
		print(display)
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
	if display == correctAnswer and solved == false:
		solved = true

func _on_4_pressed():
	key_press(4)

func _on_5_pressed():
	key_press(5)

func _on_7_pressed():
	key_press(7)

func _on_6_pressed():
	key_press(6)

func _on_3_pressed():
	key_press(3)

func _on_2_pressed():
	key_press(2)

func _on_1_pressed():
	key_press(1)

func _on_8_pressed():
	key_press(8)

func _on_9_pressed():
	key_press(9)

func _on_0_pressed():
	key_press(0)

func _on_hashtag_pressed():
	if solved == false:
		display += "#"
		print(display)
		update_texture()

func _on_x_pressed():
	if solved == false:
		display = ""
		update_texture()
