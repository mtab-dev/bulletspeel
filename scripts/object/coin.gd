extends Area2D

var speed: float = 2.0  # Velocidade da oscilação
var amplitude: float = 5.0  # Amplitude do movimento oscilante
var startY: float
var timeSpent: float = 0.0  # Tempo decorrido

func _ready() -> void:
	startY = position.y

func _process(delta: float) -> void:
	timeSpent += delta
	position.y = startY + amplitude * sin(speed * timeSpent)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Global.money += 1
		queue_free()
