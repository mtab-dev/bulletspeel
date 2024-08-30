extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $animation
@onready var healthBar: ProgressBar = $HealthBar

var health: int = 6

func _ready() -> void:
	health = 6
	animation.play('goingUp')
	healthBar.initHealth(health)
	
func _process(delta: float) -> void:
	pass

func _on_animation_animation_finished() -> void:
	animation.play('idle')
