extends Node2D

const speed = 200

func _process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_kill_timer_timeout() -> void:
	queue_free()


func _on_hitbox_body_entered(body: Node2D) -> void:
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	#queue_free()
	pass
