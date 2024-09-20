extends AnimatedSprite2D

@export var player: CharacterBody2D
var is_dead: bool = false

func animate(direction: Vector2, life: int) -> void:
	if life == 0 and not is_dead:
		if Global.playerColor == 'W':
			play("whiteDeath")
		if Global.playerColor == 'M':
			play("midDeath")
		is_dead = true
		return
	
	if not is_dead:
		verify_position(direction)
		if direction.y != 0:
			vertical_behavior(direction)
		elif direction.x != 0:
			horizontal_behavior(direction)
		else:
			idle_behavior()

func verify_position(direction: Vector2) -> void:
	if direction.x > 0:
		flip_h = false
	elif direction.x < 0:
		flip_h = true

func vertical_behavior(direction: Vector2) -> void:
	if direction.y < 0: 
		if Global.playerColor == 'W':
			play("whiteUp")
		if Global.playerColor == 'M':
			play("midUp")
	elif direction.y > 0:
		if Global.playerColor == 'W':
			play("whiteDown")
		if Global.playerColor == 'M':
			play("midDown")


func horizontal_behavior(direction: Vector2) -> void:
	if direction.x != 0:
		if Global.playerColor == 'W':
			play("whiteRun")
		if Global.playerColor == 'M':
			play("midRun")

func idle_behavior() -> void:
	if Global.playerColor == 'W':
		play("whiteIdle")
	if Global.playerColor == 'M':
		play("midIdle")
