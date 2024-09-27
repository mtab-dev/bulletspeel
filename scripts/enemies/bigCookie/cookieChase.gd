extends State
class_name CookieChase

@export var moveSpeed = 80
@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var player: CharacterBody2D
var alreadyTrans: bool = false

signal cookieChaseState

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	cookieChaseState.emit()

func transform():
	if alreadyTrans == false:
			Transitioned.emit(self, "chase")
			alreadyTrans = true
			enemy.velocity = Vector2.ZERO  

func PhysicsUpdate(_delta: float):
	if Global.health == 10:
		transform()
	var direction = player.global_position - enemy.global_position
	var distance = direction.length()
	if distance > 150:
		enemy.velocity = direction.normalized() * moveSpeed
	if distance > 300:
		Transitioned.emit(self, "idle")
