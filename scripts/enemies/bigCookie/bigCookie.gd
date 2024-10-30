extends CharacterBody2D
class_name BigCookie

@onready var animation: AnimatedSprite2D = $animation
@onready var canvasForBar: CanvasLayer = $canvasBar
@onready var healthBar: ProgressBar = $canvasBar/HealthBar
@onready var entryRoom: AudioStreamPlayer2D = $enterBoss
@onready var afterDeath: AudioStreamPlayer2D = $killDeath
var isPlayerInDetectionArea: bool = false
var health = 50.0
var player: CharacterBody2D
var isTransforming: bool = false  

signal cookieTransform
signal normalBehaviour

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	health = 50.0
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

func _process(delta: float) -> void:
	if health == 25.0:
		transformCookie()
	if health <= 25.0:
		Global.madCookie = true
	else:
		Global.madCookie = false

func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		if Global.hasLolli:
			health -= 1.5
		else:
			health -= 1.0
		healthBar.health = health
		if health <= 0:
			Global.deadCookie = true
			queue_free()

func _on_enemy_area_exited_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		canvasForBar.visible = false

func _on_kill_death_finished() -> void:
	queue_free()

func _on_enemy_area_enter_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		entryRoom.play()
		canvasForBar.visible = true
