extends Node2D

var playerInside : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerInside and Input.is_action_just_pressed("Interact"):
		_on_interact_pressed()


func _on_interactable_area_body_entered(body):
	if body.name == "Player":
		playerInside = true
		print("entered")


func _on_interactable_area_body_exited(body):
	if body.name == "Player":
		playerInside = false
	
func _on_interact_pressed():
	print("hi")
