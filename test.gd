extends Node2D

var scene0 = preload("res://Rooms/SpawnVærelse.tscn")
@onready var instance0 = scene0.instantiate()
var scene1 = preload("res://Rooms/stuen.tscn")
@onready var instance1 = scene1.instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(instance0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
