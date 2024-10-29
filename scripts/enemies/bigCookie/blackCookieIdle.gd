extends State
class_name BlackCookieIdle

var player: CharacterBody2D
var transformTimer: Timer 
var isTransforming: bool = false
@export var enemy: CharacterBody2D 
@export var moveSpeed: int = 5
@export var texture: AnimatedSprite2D

var moveDirection: Vector2
var wanderTime: float

func randomizeWander():
	moveDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wanderTime = randf_range(1, 2)

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	transformTimer = Timer.new()
	transformTimer.wait_time = 1.6
	transformTimer.one_shot = true  
	add_child(transformTimer)  
	transformTimer.connect("timeout", Callable(self, "_on_transform_timer_timeout"))
	texture.play('blackIdle')
	randomizeWander()

func Update(delta: float):
	if wanderTime > 0:
		wanderTime -= delta
	else:
		randomizeWander()

func PhysicsUpdate(_delta: float):
	if isTransforming:
		enemy.velocity = Vector2.ZERO  
	else:
		if enemy:
			enemy.velocity = moveDirection * moveSpeed
		var direction = player.global_position - enemy.global_position
		if direction.length() < 150:
			Transitioned.emit(self, "chase")
		texture.play('blackIdle')
