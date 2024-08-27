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
				shoot(event.position)

func shoot(targetPosition: Vector2) -> void:
	Global.ammunation -= 1
	var newBullet = BULLET.instantiate()
	newBullet.position = startShot.global_position
	newBullet.set_direction(newBullet.position, targetPosition)  # Use a posição atual da bala como ponto inicial
	get_tree().root.add_child(newBullet)  # Adicionar o projétil à cena principal

func _physics_process(delta: float) -> void:
	rotate(get_angle_to(get_global_mouse_position()))
	texture.rotation_degrees = -rotation_degrees
