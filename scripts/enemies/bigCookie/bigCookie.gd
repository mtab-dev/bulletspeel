extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $animation
@onready var canvasForBar: CanvasLayer = $canvasBar
@onready var healthBar: ProgressBar = $canvasBar/HealthBar
@onready var entryRoom: AudioStreamPlayer2D = $enterBoss
@onready var afterDeath: AudioStreamPlayer2D = $killDeath
var isHit: bool = false
var health = 20
var player: CharacterBody2D

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	health = 20
	healthBar.initHealth(health)

func _physics_process(delta):
	isHit = false
	if velocity.x > 0:
		animation.flip_h = false
	else:
		animation.flip_h = true
	move_and_slide()

func _process(delta: float) -> void:
	if health <= 10:
		Global.madCookie = true
	else:
		Global.madCookie = false

func _on_detection_area_body_entered(body):
	pass

func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		print('atingiu')
		health -= 1
		healthBar.health = health  # Use "value" instead of "health" if that's the property name for updating the ProgressBar
		if health <= 0:
			Global.deadCookie = true
			queue_free()


func _on_enemy_area_body_entered(body: Node2D) -> void:
	if(body.is_in_group('Player')):
		entryRoom.play()
		canvasForBar.visible = true


func _on_enemy_area_exited_body_entered(body: Node2D) -> void:
	if(body.is_in_group('Player')):
		canvasForBar.visible = false


func _on_kill_death_finished() -> void:
	queue_free()


func _on_hit_box_body_entered(body: Node2D) -> void:
	if not Global.isDead:
		if body.is_in_group('Player'):
			isHit = true
			animation.play('whiteAttack')


func _on_animation_animation_finished() -> void:
	if isHit == true:
		Global.life -= 1
