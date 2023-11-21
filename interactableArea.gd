extends Node2D

var playerInside : bool = false
# Called when the node enters the scene tree for the first time.

@onready var paper = load("res://UIParchment.tscn")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interactable_area_body_entered(body):
	if body.name == "Player":
		playerInside = true
		print("entered")
		if Input.is_action_just_pressed("Interact"):
			_on_interact_pressed()


func _on_interactable_area_body_exited(body):
	if body.name == "Player":
		playerInside = false
	
func _on_interact_pressed():
	var instance = paper.instantiate()
	add_child(instance)
	
