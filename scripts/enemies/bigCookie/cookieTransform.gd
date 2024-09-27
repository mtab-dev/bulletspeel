extends State

@export var enemy: CharacterBody2D 
@export var anim: AnimatedSprite2D 
var alreadyTrans: bool = false

signal transformCookieState

func Enter():
	if alreadyTrans == true:
		Transitioned.emit(self, "chase")
	enemy.velocity = Vector2.ZERO
	transformCookieState.emit()


func _on_anim_animation_finished() -> void:
	if anim.animation == "white2black":
		alreadyTrans = true
		Transitioned.emit(self, "chase")
