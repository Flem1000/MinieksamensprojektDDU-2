extends CharacterBody2D

var move_speed = 75.0
const dash_speed = 1000
const dash_duration = 0.2
var playerposition
var busy = false
var escaping = false

@onready var anim = $Sprite2D2/AnimationPlayer
@onready var sprite = $Sprite2D2
@onready var dash = $dash

signal isInteracting

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("dash"):
		dash.start_dash(dash_duration)
	if busy == true:
		move_speed = 0
	else:
		move_speed = 75.0
	if Global.escaping == true and escaping == false:
		busy = true
		escaping = true
	if Global.escaping == false and escaping == true:
		busy = false
		escaping = false

func _physics_process(delta):
	var direction_x = Input.get_axis("Left", "Right")
	if direction_x:
		velocity.x = direction_x * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		
	var direction_y = Input.get_axis("Up", "Down")
	if direction_y:
		velocity.y = direction_y * move_speed
	else:
		velocity.y = move_toward(velocity.y, 0, move_speed)
	
	if velocity.x > 0:
		sprite.flip_h = false
		anim.play("runBlack")
	elif velocity.x < 0:
		sprite.flip_h = true
		anim.play("runBlack")
	elif velocity.y != 0:
		anim.play("runBlack")
	else:
		anim.play("IdleBlack")
	move_and_slide()

func interacting():
	emit_signal("isInteracting")
	if busy == false:
		busy = true
	elif busy == true:
		busy = false

