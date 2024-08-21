extends State
class_name EnemyChase

@export var moveSpeed = 40
@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var player: CharacterBody2D
var alreadyAnim: bool = false


func Enter():
	player = get_tree().get_first_node_in_group("Player")
	texture.play("run")

func PhysicsUpdate(_delta: float):
	var direction = player.global_position - enemy.global_position
	var distance = direction.length()
	if distance > 50:
		enemy.velocity = direction.normalized() * moveSpeed
	if distance > 200:
		Transitioned.emit(self, "idle")


func _on_bengal_animation_animation_finished() -> void:
	texture.frame = 8
