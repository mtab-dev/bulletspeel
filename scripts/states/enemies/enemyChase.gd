extends State
class_name EnemyChase

@export var moveSpeed = 40
@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	texture.play("run")

func PhysicsUpdate(_delta: float):
	var direction = player.global_position - enemy.global_position
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * moveSpeed
	else:
		enemy.velocity = Vector2()
	if direction.length() > 40:
		Transitioned.emit(self, "idle")
