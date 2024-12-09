extends State
class_name CookieShoot

@export var enemy: CharacterBody2D
@export var animation: AnimatedSprite2D
@export var shootTimer: Timer
@export var rotator: Node2D
const BULLET = preload('res://scenes/objects/boss_shot.tscn')
const rotate_speed = 100
const shootTimerWait = 0.2
const spawnPointCount = 8
const  radius = 100
var player: CharacterBody2D

#https://www.youtube.com/watch?v=Z2TaFnN7cdU 
#watch later

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	animation.play("run")
	if player == null: 
		Transitioned.emit(self, "idle")
	var step = 2 * PI / spawnPointCount
	for i in range(spawnPointCount):
		var spawnPoint = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		rotator.add_child(spawnPoint)
	shootTimer.wait_time = shootTimerWait
	shootTimer.start()


func Update(_delta: float):
	var newRotation = rotator.rotation_degrees + rotate_speed * _delta
	rotator.rotation_degrees = fmod(newRotation, 360)
	var direction = player.global_position - enemy.global_position
	var distance = direction.length()
	enemy.velocity = direction.normalized() * 150


func _on_shoot_timer_timeout() -> void:
	for s in rotator.get_children():
		var newBullet = BULLET.instantiate()
		get_tree().root.add_child(newBullet) 
		newBullet.position = s.global_position
		newBullet.rotation = s.global_rotation
	Transitioned.emit(self, "chase")
