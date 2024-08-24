extends Area2D

@onready var startShot: Marker2D = $gunPivot/texture/shots
@onready var texture: AnimatedSprite2D = $gunPivot/texture
const BULLET = preload('res://scenes/objects/missile.tscn')

func _ready() -> void:
	texture.play('default')
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			shoot(event.position)

func shoot(targetPosition):
	var newBullet = BULLET.instantiate()
	newBullet.position = startShot.global_position
	newBullet.set_direction(startShot.position, targetPosition)
	startShot.add_child(newBullet)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		print('clickou')
		var clickPosition = get_global_mouse_position()
		#shoot(clickPosition)
		
func _process(delta: float) -> void:
	rotate(get_angle_to(get_global_mouse_position()))
	texture.rotation_degrees = -rotation_degrees
