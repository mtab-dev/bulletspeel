extends State
class_name EnemyChase

@export var moveSpeed = 150
@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var player: CharacterBody2D
var attackCooldown = 1.0
var cooldownTimer: float = 0.0

func followPlayer():
	if player == null:
		return  	
	var direction = player.global_position - enemy.global_position
	var distance = direction.length()
	if distance < 200:
		enemy.velocity = direction.normalized() * moveSpeed
		texture.play('run')
	else:
		Transitioned.emit(self, "idle") 
	if distance <= 40: 
		Transitioned.emit(self, "attack")

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	if player == null:
		return
	else:
		followPlayer()
		
func Update(_delta: float):
	if cooldownTimer > 0:
		cooldownTimer -= _delta 
	followPlayer()

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player') and cooldownTimer <= 0:
		enemy.velocity = Vector2.ZERO
		texture.play('attack')
		Transitioned.emit(self, "attack")

func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		followPlayer()
		texture.play('run')


func _on_bengal_animation_animation_finished() -> void:
	if texture.animation == 'run':
		texture.set_frame(8)
