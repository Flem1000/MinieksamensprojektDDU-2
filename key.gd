extends Node2D

@onready var area = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Global.keys += 1
		body.get_parent().get_parent().key_got()
		self.queue_free()
