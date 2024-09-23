extends State
class_name EnemyChase

@export var moveSpeed = 150
@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var player: CharacterBody2D
var alreadyAnim: bool = false

func followPlayer():
	if player == null:
		return  
	else:
		var direction = player.global_position - enemy.global_position
		var distance = direction.length()

		if distance < 150:
			enemy.velocity = direction.normalized() * moveSpeed
			texture.play('run')
		else:
			enemy.velocity = Vector2.ZERO  
		if distance > 250:
			Transitioned.emit(self, "idle")

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	if player == null:
		return
	else:
		followPlayer() 

func PhysicsUpdate(_delta: float):
	followPlayer()  

func _on_bengal_animation_animation_finished() -> void:
	texture.frame = 8


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		enemy.velocity = Vector2.ZERO
		texture.play('attack')


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group('Player'):
		followPlayer()
		texture.play('run')
