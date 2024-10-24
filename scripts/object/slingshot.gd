extends Area2D

@onready var startShot: Marker2D = $gunPivot/texture/shots
@onready var texture: AnimatedSprite2D = $gunPivot/texture
const BULLET = preload('res://scenes/objects/missile.tscn')

func _ready() -> void:
	texture.play('default')

func _input(event: InputEvent) -> void:
	if Global.ammunation > 0:
		if event is InputEventMouseButton and event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				shoot(get_global_mouse_position())  

func shoot(targetPosition: Vector2) -> void:
	Global.ammunation -= 1
	texture.play('shot')
	var newBullet = BULLET.instantiate()
	newBullet.position = startShot.global_position
	newBullet.set_direction(newBullet.position, targetPosition)
	get_tree().root.add_child(newBullet)
	


func _physics_process(delta: float) -> void:
	rotate(get_angle_to(get_global_mouse_position()))
	texture.rotation_degrees = -rotation_degrees


func _on_texture_animation_finished() -> void:
	if texture.animation == 'shot':
		texture.play('default')
