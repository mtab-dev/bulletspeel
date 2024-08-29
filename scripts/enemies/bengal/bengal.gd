extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $bengalAnimation
@onready var damageSound: AudioStreamPlayer = $damage
var player: CharacterBody2D
var bengalLife: int = 4
const COIN = preload("res://scenes/objects/drops/coin.tscn")
const AMMUN = preload("res://scenes/objects/drops/ammunation.tscn")

func dropCoin():
	var drop_position = self.global_position
	var newCoin = COIN.instantiate()
	newCoin.position = drop_position
	get_tree().current_scene.add_child(newCoin)  
	
func dropAmmun():
	var drop_position = self.global_position
	var newAmmun = AMMUN.instantiate()
	newAmmun.position = drop_position
	get_tree().current_scene.add_child(newAmmun)

func randomDrop():
	var randomize = randi() % 2  
	if randomize == 0:
		dropCoin()
	else:
		dropAmmun()


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
		randomDrop()
		queue_free()

func _on_detection_area_body_entered(body):
	if body.is_in_group('Player'):
		animation.play('attack')
		damageSound.play()
		Global.life -= 1

func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		bengalLife -= 1
