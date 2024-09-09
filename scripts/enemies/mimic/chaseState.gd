extends State
class_name MimicChase

@export var moveSpeed = 110
@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var player: CharacterBody2D
var alreadyAnim: bool = false


func Enter():
	player = get_tree().get_first_node_in_group("Player")

func PhysicsUpdate(_delta: float):
	var direction = player.global_position - enemy.global_position
	var distance = direction.length()
	if distance > 150:
		texture.play('walking')
		enemy.velocity = direction.normalized() * moveSpeed
	if distance > 300:
		Transitioned.emit(self, "idle")



func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		enemy.velocity = Vector2.ZERO
