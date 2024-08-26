extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $bengalAnimation
@onready var damageSound: AudioStreamPlayer = $damage
var player: CharacterBody2D
var bengalLife: int = 4
const COIN = preload("res://scenes/objects/drops/coin.tscn")

func drop_coin():
	var drop_position = self.global_position
	var new_coin = COIN.instantiate()
	new_coin.position = drop_position
	get_tree().current_scene.add_child(new_coin)  # Adiciona o coin à cena atual

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta):
	if velocity.x > 0:
		animation.flip_h = false
	else:
		animation.flip_h = true
	move_and_slide()

func _process(delta: float) -> void:
	if bengalLife <= 0:
		drop_coin()
		queue_free()

func _on_detection_area_body_entered(body):
	if body.is_in_group('Player'):
		if not player.isDead:
			animation.play('attack')
			damageSound.play()
			Global.life -= 1

func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		bengalLife -= 1
