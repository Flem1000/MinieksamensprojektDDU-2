extends CharacterBody2D

@onready var anim = $Sprite2D2/AnimationPlayer
@onready var sprite = $Sprite2D2

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	var vel : Vector2 = (get_global_mouse_position() - global_position)
	if vel.length() > 50:
		vel = vel.normalized() * 500
	velocity = vel
	move_and_slide()
	
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
