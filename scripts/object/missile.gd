extends Area2D

@export var speed = 200
@export var damage = 15
var target_position = Vector2.ZERO
var direction = Vector2.ZERO

func set_direction(start_position: Vector2, target_position: Vector2):
	self.position = start_position
	self.target_position = target_position
	direction = (start_position - target_position).normalized()
	rotation = direction.angle()

func _physics_process(delta):
	if position.distance_to(target_position) > speed * delta:
		position += direction * speed * delta
	else:
		position = target_position
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	queue_free()
