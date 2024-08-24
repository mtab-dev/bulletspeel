extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $bengalAnimation
@onready var damageSound: AudioStreamPlayer = $damage
var player: CharacterBody2D
var bengalLife: int = 4

func _ready():
	player = get_tree().get_first_node_in_group("Player")


func _physics_process(delta):
	if velocity.x > 0:
		animation.flip_h = false
	else: 
		animation.flip_h = true
	move_and_slide()



func _on_detection_area_body_entered(body):
	if(body.is_in_group('Player')):
		if !player.isDead:
			animation.play('attack') 
			damageSound.play()
			Global.life -=1



func _on_detection_area_area_entered(area: Area2D) -> void:
	if(area.is_in_group('Bullets')):
		print('pegou')
		print(bengalLife)
		bengalLife -= 1
		if bengalLife <= 0:
			queue_free()
