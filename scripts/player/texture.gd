extends Sprite2D
class_name PlayerTexture

@export var animation: AnimatedSprite2D = null
@export var player: CharacterBody2D
var suffix: String 
var anim_time: int = 1
var anim_name: String

func animate(direction: Vector2) -> void:
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
		animation.play("up")
	
	elif direction.y > 0:
		animation.play("down")



func horizontal_behavior(direction: Vector2) -> void:
	if direction.x != 0:
		animation.play("run")

func idle_behavior() -> void:
	animation.play("idle")
	
