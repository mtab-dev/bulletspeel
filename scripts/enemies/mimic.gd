extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $animation
@onready var healthBar: ProgressBar = $HealthBar
var health = 7
var player: CharacterBody2D

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	animation.play('idle')
	health = 6
	healthBar.initHealth(health)

func _physics_process(delta):
	if velocity:
		animation.play('walking')
	if velocity.x > 0:
		animation.flip_h = false
	else:
		animation.flip_h = true
	move_and_slide()

func _on_hit_box_body_entered(body: Node2D) -> void:
	animation.play('attack')


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		health -= 1
		healthBar.health = health  
		if health <= 0:
			queue_free()

func _on_animation_animation_finished() -> void:
	Global.life -= 1
