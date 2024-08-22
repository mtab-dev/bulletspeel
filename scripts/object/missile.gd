extends Area2D

@export var speed = 200
@export var damage = 15
var range = 700
var travelDistance = 0

func set_direction(missileDirection):
	var directiones = missileDirection
	rotation_degrees = rad_to_deg(global_position.angle_to_point(global_position + directiones))
	
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travelDistance += speed * delta
	if travelDistance > range:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	queue_free()
