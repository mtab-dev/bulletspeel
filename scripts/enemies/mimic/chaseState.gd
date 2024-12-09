extends State
class_name MimicChase

@export var moveSpeed: int = 110
@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var player: CharacterBody2D
var alreadyAnim: bool = false
var isInHit: bool = false
var cooldownTimer: float = 0.0

func followPlayer():
	if player == null:
		return
	var direction = player.global_position - enemy.global_position
	var distance = direction.length()
	if distance > 150:
		texture.play('walking')
		enemy.velocity = direction.normalized() * moveSpeed
	if distance > 300:
		Transitioned.emit(self, "idle")

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	isInHit = false
	if player == null:
		return
	else:
		followPlayer()

func Update(_delta: float):
	followPlayer()

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		isInHit = true
		texture.play('attack')


func _on_hit_box_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		isInHit = false


func _on_animation_animation_finished() -> void:
	if isInHit == true:
		Global.life -= 1 
		texture.play('attack')


func _on_mimic_dead() -> void:
	Transitioned.emit(self, "death")
