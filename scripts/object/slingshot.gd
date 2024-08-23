extends Area2D

@onready var startShot: Marker2D = $gunPivot/texture/shots
@onready var texture: AnimatedSprite2D = $gunPivot/texture

func _ready() -> void:
	texture.play('default')
	

func shoot():
	const BULLET = preload('res://scenes/objects/missile.tscn')
	var newBullet = BULLET.instantiate()
	newBullet.global_position = startShot.global_position
	startShot.add_child(newBullet)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		print('clickou')
		shoot()
		
func _process(delta: float) -> void:
	rotate(get_angle_to(get_global_mouse_position()))
