extends CharacterBody2D
class_name Bengal

@onready var animation: AnimatedSprite2D = $bengalAnimation
@onready var flash: Timer = $flashTimer
@onready var deathFx: AudioStreamPlayer2D = $bengalDeath
var player: CharacterBody2D
var bengalLife: float = 4.0
var _bengalLife: float: 
	set(value): 
		bengalLife = value
		_set_bengal_life(value)
	get: return bengalLife

signal deadBengal

func setShader(newValue: float):
	animation.material.set_shader_parameter("blinkIntesity", newValue)

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	bengalLife = 4.0  # Inicializa a vida

func _physics_process(delta):
	if velocity.x > 0:
		animation.flip_h = false
	else:
		animation.flip_h = true
	move_and_slide()

func _set_bengal_life(value: float) -> void:
	bengalLife = value
	if bengalLife <= 0:
		die()

func die():
	deadBengal.emit()
	Global.enemiesKilled += 1
	deathFx.play()

func _on_detection_area_body_entered(body):
	if body.is_in_group('Player'):
		pass

func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		if Global.hasLolli:
			_set_bengal_life(bengalLife - 1.5)
		else:
			_set_bengal_life(bengalLife - 1.0)
		var tween = get_tree().create_tween()
		tween.tween_method(setShader, 1.0, 0.0, 0.2)
		flash.start()
