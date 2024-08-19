extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $bengalAnimation
@onready var damageSound: AudioStreamPlayer = $damage

func _ready():
	pass

func _physics_process(delta):
	if velocity.x > 0:
		animation.flip_h = false
	else: 
		animation.flip_h = true
	move_and_slide()



func _on_detection_area_body_entered(body):
	if(body.is_in_group('Player')):
		damageSound.play()
		Global.life -=1
