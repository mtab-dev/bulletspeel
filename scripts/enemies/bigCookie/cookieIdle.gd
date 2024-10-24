extends State
class_name CookieIdle

@export var enemy: CharacterBody2D 
var moveSpeed: int = 5
var player: CharacterBody2D
var moveDirection: Vector2
var wanderTime: float

signal cookieIdleState

func randomizeWander():
	moveDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wanderTime = randf_range(1, 2)

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomizeWander()
	cookieIdleState.emit()

func Update(delta: float):
	if wanderTime > 0:
		wanderTime -= delta
	else:
		randomizeWander()
	var direction = player.global_position - enemy.global_position


func PhysicsUpdate(_delta: float):
	if Global.health == 10:
		enemy.velocity = Vector2.ZERO  
	else:
		if enemy:
			enemy.velocity = moveDirection * moveSpeed
		if player:
			var direction = player.global_position - enemy.global_position
