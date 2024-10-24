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

func _on_hit_box_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Player")):
		Transitioned.emit(self, "attack")
