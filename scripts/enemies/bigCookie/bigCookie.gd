extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $animation
var suffix: String
var player: CharacterBody2D

func _ready():
	player = get_tree().get_first_node_in_group("Player")


func _physics_process(delta):
	if velocity.x > 0:
		animation.flip_h = false
	else: 
		animation.flip_h = true
	move_and_slide()

func _process(delta: float) -> void:
	if Global.madCookie:
		suffix = 'black'
	suffix = 'white'


func _on_detection_area_body_entered(body):
	if(body.is_in_group('Player')):
		if !player.isDead:
			animation.play(suffix+'Attack') 
			Global.life -=1
		animation.play(suffix+'Idle')
