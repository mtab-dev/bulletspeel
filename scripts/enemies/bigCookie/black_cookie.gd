extends CharacterBody2D
class_name BlackCookie

@onready var animation: AnimatedSprite2D = $animation
@onready var canvasForBar: CanvasLayer = $canvasBar
@onready var healthBar: ProgressBar = $canvasBar/HealthBar
@onready var entryRoom: AudioStreamPlayer2D = $enterBoss
@onready var afterDeath: AudioStreamPlayer2D = $killDeath
var isPlayerInDetectionArea: bool = false
var health = 10
var player: CharacterBody2D

signal cookieTransform
signal damagePlayer

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	health = 10
	healthBar.initHealth(health)
	canvasForBar.visible = true

func _physics_process(delta):
	if velocity.x > 0:
		animation.flip_h = false
	else:
		animation.flip_h = true
	move_and_slide()



func _on_detection_area_body_entered(body):
	if body.is_in_group('Player'):
		velocity = Vector2.ZERO
		isPlayerInDetectionArea = true 
		animation.play('blackAttack')

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


func _on_kill_death_finished() -> void:
	queue_free()

func hitWhenAnim():
	if isPlayerInDetectionArea == true:
		animation.play('blackAttack')
		Global.life -= 1

func _on_animation_animation_finished() -> void:
	hitWhenAnim()
