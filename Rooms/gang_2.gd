extends Node2D

@onready var footprints_1 = $Footprints1
@onready var footprints_2 = $Footprints2
@onready var footprints_3 = $Footprints3
@onready var footprints_4 = $Footprints4


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.keys == 1:
		footprints_1.hide()
		footprints_2.show()
	elif Global.keys == 2:
		footprints_2.hide()
		footprints_3.show()
	elif Global.keys == 3:
		footprints_3.hide()
		footprints_4.show()
