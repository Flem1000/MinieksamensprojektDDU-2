extends Sprite2D

@onready var keypad = $"Interactable area3/Node2D"
@onready var area = $Area2D
@onready var door = $Door2
var player
var playerInside


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if keypad.solved == true and playerInside == true:
		player.interacting()
		door.position = Vector2(0, 1)


func _on_area_2d_body_entered(body):
	player = body
	playerInside = true
	return player


func _on_area_2d_body_exited(body):
	playerInside = false
