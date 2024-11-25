extends State
class_name CookieShoot

@export var enemy: CharacterBody2D
@export var shootTimer: Timer
const BULLET = preload('res://scenes/objects/missile.tscn')
var bullet_count = 8
var radius = 100

#https://www.youtube.com/watch?v=Z2TaFnN7cdU 
#watch later

func shoot():
	shootTimer.start()
	if not shootTimer.is_stopped():
		var newBullet = BULLET.instantiate()
		newBullet.position = enemy.global_position
		newBullet.set_direction(newBullet.position, Vector2.AXIS_X)
		get_tree().root.add_chil(newBullet)

func Enter():
	enemy.velocity = Vector2.ZERO
	shoot()

func _on_shoot_timer_timeout() -> void:
	Transitioned.emit(self, "idle")
