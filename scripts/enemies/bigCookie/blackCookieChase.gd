extends State
class_name BlackCookieChase

@export var moveSpeed = 80
@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var transformTimer: Timer
var isTransforming: bool = false
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	transformTimer = Timer.new()
	transformTimer.wait_time = 1.6 
	transformTimer.one_shot = true  
	add_child(transformTimer)  
	transformTimer.connect("timeout", Callable(self, "_on_transform_timer_timeout"))

func PhysicsUpdate(_delta: float):
	if isTransforming:
		enemy.velocity = Vector2.ZERO  
	else:
		var direction = player.global_position - enemy.global_position
		var distance = direction.length()
		if distance > 150:
			enemy.velocity = direction.normalized() * moveSpeed
			texture.play("blackRun")
		if distance > 300:
			Transitioned.emit(self, "idle")
