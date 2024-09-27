extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $anim
@onready var canvasForBar: CanvasLayer = $canvasBar
@onready var healthBar: ProgressBar = $canvasBar/HealthBar
@onready var entryRoom: AudioStreamPlayer2D = $enterBoss
@onready var afterDeath: AudioStreamPlayer2D = $killDeath
var player: CharacterBody2D

signal cookieTransform

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	healthBar.initHealth(Global.health)

func _physics_process(delta):
	if velocity.x > 0:
		animation.flip_h = false
	else:
		animation.flip_h = true
	move_and_slide()

func transformCookie():
	cookieTransform.emit()

func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		Global.health -= 1
		healthBar.health = Global.health
		if Global.health <= 0:
			Global.deadCookie = true
			queue_free()


func _on_enemy_area_exited_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		canvasForBar.visible = false


func _on_enemy_area_enter_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		canvasForBar.visible = true