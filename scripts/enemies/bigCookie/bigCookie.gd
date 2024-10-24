extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $animation
@onready var canvasForBar: CanvasLayer = $canvasBar
@onready var healthBar: ProgressBar = $canvasBar/HealthBar
@onready var afterDeath: AudioStreamPlayer2D = $killDeath
var newCookie = preload("res://scenes/enemies/blackCookie.tscn")
var isPlayerInDetectionArea: bool = false
var health = 20
var player: CharacterBody2D
var isTransforming: bool = false  # Para controlar se está em transformação

signal cookieTransform
signal damagePlayer

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

func transformCookie():
	cookieTransform.emit()
	animation.play('white2black')  
	
func atkAnim():
	if Global.madCookie == true:
		animation.play('blackAttack')
	else:
		animation.play('whiteAttack')

func _process(delta: float) -> void:
	if health == 10:
		transformCookie()
	if health <= 10:
		Global.madCookie = true
	else:
		Global.madCookie = false

func _on_detection_area_body_entered(body):
	if body.is_in_group('Player'):
		velocity = Vector2.ZERO
		isPlayerInDetectionArea = true 
		atkAnim()

func _on_detection_area_body_exited(body):
	if body.is_in_group('Player'):
		isPlayerInDetectionArea = false

func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		health -= 1
		healthBar.health = health
		if health <= 0:
			Global.deadCookie = true
			queue_free()

func _on_enemy_area_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		canvasForBar.visible = true

func _on_enemy_area_exited_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		canvasForBar.visible = false

func _on_kill_death_finished() -> void:
	queue_free()

func hitWhenAnim():
	if isPlayerInDetectionArea == true:
		atkAnim()
		damagePlayer.emit()
	if animation.animation == 'white2black':
		var blackCookie = newCookie.instantiate()
		blackCookie.global_position = self.global_position
		get_parent().add_child(blackCookie)
		queue_free()

func _on_animation_animation_finished() -> void:
	hitWhenAnim()
