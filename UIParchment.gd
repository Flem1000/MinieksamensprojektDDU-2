extends Node2D

var area = get_owner()
var text
@onready var label = $CanvasLayer/Label



# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_button_pressed():
	get_parent().not_interacting()
	queue_free()
	
