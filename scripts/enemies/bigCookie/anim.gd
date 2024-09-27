extends AnimatedSprite2D

@export var enemy: CharacterBody2D
	
func _process(delta: float) -> void:
	pass


func _on_idle_cookie_idle_state() -> void:
	if Global.health <= 10:
		play("blackIdle")
	else:
		play("whiteIdle")


func _on_chase_cookie_chase_state() -> void:
	if Global.health <= 10:
		play("blackRun")
	else:
		play("whiteRun")


func _on_transform_transform_cookie_state() -> void:
	play("white2black")
