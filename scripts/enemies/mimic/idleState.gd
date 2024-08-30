extends State
class_name MimicIdle

var player: CharacterBody2D
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
	randomizeWander()

func Update(delta: float):
	if wanderTime > 0:
		wanderTime -= delta
	else:
		randomizeWander()
		
func PhysicsUpdate(_delta: float):
	if enemy:
		enemy.velocity = moveDirection * moveSpeed
	var direction = player.global_position - enemy.global_position
	if direction.length() < 150:
		Transitioned.emit(self, "chase")


func _process(delta: float) -> void:
	var direction = player.global_position - enemy.global_position
	
