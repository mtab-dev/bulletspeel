extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $animation
@onready var canvasForBar: CanvasLayer = $canvasBar
@onready var healthBar: ProgressBar = $canvasBar/HealthBar
var health: int = 20
var suffix: String
var player: CharacterBody2D

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	health = 20
	healthBar.initHealth(health)

func _physics_process(delta):
	if velocity.x > 0:
		animation.flip_h = false
	else:
		animation.flip_h = true
	move_and_slide()

func _process(delta: float) -> void:
	if Global.madCookie:
		suffix = 'black'
	else:
		suffix = 'white'

func _on_detection_area_body_entered(body):
	pass


func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		print('atingiu')
		health -= 1
		healthBar.health = health  # Use "value" instead of "health" if that's the property name for updating the ProgressBar
		if health <= 0:
			queue_free()  # Example to remove the enemy when health is depleted


func _on_enemy_area_body_entered(body: Node2D) -> void:
	if(body.is_in_group('Player')):
		canvasForBar.visible = true


func _on_enemy_area_exited_body_entered(body: Node2D) -> void:
	if(body.is_in_group('Player')):
		canvasForBar.visible = false
