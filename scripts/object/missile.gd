extends Area2D

@export var speed = 200
@export var damage = 15
var direction = Vector2.ZERO

func set_direction(start_position: Vector2, target_position: Vector2):
	position = start_position
	direction = (target_position - start_position).normalized()
	rotation = direction.angle()

func _physics_process(delta):
	position += direction * speed * delta
	#FINALMENTE FUNCIONOU ALELUUIAAAA

func _on_area_entered(area: Area2D) -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	queue_free()
