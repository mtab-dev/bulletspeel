extends State
class_name CookieAttack

@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D

var attackCooldown = 1.0
var attackRange = 60
var player: CharacterBody2D
var canAttack: bool = true
var cooldownTimer: float = 0.0

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	if player == null:
		Transitioned.emit(self, "idle")

func Update(_delta: float):
	if player == null:
		Transitioned.emit(self, "idle")
	else:
		enemy.velocity = Vector2.ZERO
		attack()

func attack():
	if Global.madCookie == true:
		texture.play('blackAttack')
	else:
		texture.play('whiteAttack')

func Exit():
	texture.stop()


func _on_animation_animation_finished() -> void:
	var distance = player.global_position.distance_to(enemy.global_position)
	if texture.animation == 'whiteAttack' or 'blackAttack':
		if distance > attackRange:
			Transitioned.emit(self, "chase")
		else:
			Global.life -= 1
			attack()


func _on_big_cookie_dead_cookie() -> void:
	Transitioned.emit(self, "death")
