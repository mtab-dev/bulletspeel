extends Camera2D
class_name PlayerCamera

@export var randomStrengh: float = 20.0
@export var shakeFade: float = 5.0

var rnd =  RandomNumberGenerator.new()

var  shakeStrenght: float = 0.0

func applyShake():
	shakeStrenght = randomStrengh

func _process(delta: float) -> void:
	if shakeStrenght > 0:
		shakeStrenght = lerpf(shakeStrenght,0, shakeFade * delta)
		offset = randomOffset()

func randomOffset() -> Vector2:
	return Vector2(rnd.randf_range(-shakeStrenght, shakeStrenght), rnd.randf_range(-shakeStrenght, shakeStrenght))


func _on_player_big_damage() -> void:
	applyShake()
