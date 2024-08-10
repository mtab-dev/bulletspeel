extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $bengalAnimation

func _ready():
	pass

func _physics_process(delta):
	if velocity.x > 0:
		animation.flip_h = false
	else: 
		animation.flip_h = true
	move_and_slide()

