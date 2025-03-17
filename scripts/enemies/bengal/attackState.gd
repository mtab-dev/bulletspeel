extends State
class_name AttackState

@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
@export var fx: AudioStreamPlayer2D

var attackCooldown = 1.0
var attackRange = 40
var player: CharacterBody2D
var canAttack: bool = true
var cooldownTimer: float = 0.0

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	if player == null:
		return

func Update(_delta: float):
	if player == null:
		Transitioned.emit(self, "idle")
		return
	var distance = player.global_position.distance_to(enemy.global_position)
	if distance > attackRange:
		Transitioned.emit(self, "chase")
	else:
		if canAttack:
			attack()
			canAttack = false
			cooldownTimer = attackCooldown  
	if not canAttack:
		cooldownTimer -= _delta
		if cooldownTimer <= 0:
			canAttack = true

func attack():
	texture.play('attack')
	fx.play()
	Global.life -= 1

func Exit():
	texture.stop()

func _on_bengal_dead_bengal() -> void:
	Transitioned.emit(self, "death")
