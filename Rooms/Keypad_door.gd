extends Sprite2D

@onready var keypad = $"Interactable area3/Node2D"
@onready var door = $Door2
@onready var interactable_area = $"Interactable area3"
var player
var playerInside

var solved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if solved == false:
		if keypad.solved == true and playerInside == true:
			player.interacting()
			door.position = Vector2(0, 1)
			keypad.solved = false
			interactable_area.queue_free()
			solved = true
		


func _on_area_2d_body_entered(body):
	player = body
	playerInside = true
	return player


func _on_area_2d_body_exited(body):
	playerInside = false
