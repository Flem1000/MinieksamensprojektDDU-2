extends Node2D



var playerInside : bool = false
var player
var interacting = false
# Called when the node enters the scene tree for the first time.




func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerInside == true and Input.is_action_just_pressed("Interact") and interacting == false and Global.escaping == false:
			_on_interact_pressed()
			player.interacting()
			get_owner().get_parent().interact()
			interacting = true

	elif playerInside == true and Input.is_action_just_pressed("Interact") and interacting == true and Global.escaping == false:
		not_interacting()
		get_owner().get_parent().interact()
		get_child(1).get_child(0).hide()

func force_close():
	not_interacting()
	get_owner().get_parent().interact()
	get_child(1).get_child(0).hide()

func not_interacting():
	interacting = false
	player.interacting()


func _on_interactable_area_body_entered(body):
	if body.name == "Player":
		playerInside = true
		print("entered")
		player = body
	return player
		



func _on_interactable_area_body_exited(body):
	if body.name == "Player":
		playerInside = false
	
func _on_interact_pressed():
	get_child(1).get_child(0).show()
	
	
