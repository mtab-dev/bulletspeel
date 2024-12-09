extends State
class_name DeadCookie

@export var enemy: CharacterBody2D
@export var anim: AnimatedSprite2D

func Enter() -> void:
	enemy.velocity = Vector2.ZERO
	anim.play('death')


func _on_animation_animation_finished() -> void:
	if anim.animation == 'death':
		enemy.queue_free()
