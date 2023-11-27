extends Node2D

var solved_puzzles = 0
@onready var key = $Key


func puzzle_solved():
	solved_puzzles += 1
	if solved_puzzles == 6:
		key.position = Vector2(88, 282)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

