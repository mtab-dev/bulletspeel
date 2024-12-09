extends State
class_name MimicWakingState

@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D

func Enter():
	texture.play('goingUp')


func _on_animation_animation_finished() -> void:
	if texture.animation == 'goingUp':
		Transitioned.emit(self, "idle")


func _on_mimic_dead() -> void:
	Transitioned.emit(self, "death")
