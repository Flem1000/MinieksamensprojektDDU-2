extends Node2D
@export var destination: String
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		player = body
		player.position += (player.global_position-global_position).normalized()*5
		get_tree().get_root().get_node("Load").call_deferred("changeScene",destination)
		
		
