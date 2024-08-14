extends Area2D

@export var speed = 200
@export var damage = 15

var direction: Vector2

func set_direction(missileDirection):
	direction = missileDirection
	rotation_degrees = rad_to_deg(global_position.angle_to_point(global_position + direction))
	
func _physics_process(delta):
	global_position += direction * speed * delta
