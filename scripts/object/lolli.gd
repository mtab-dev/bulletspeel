extends Area2D

var speed: float = 2.0  
var amplitude: float = 5.0  
var startY: float
var timeSpent: float = 0.0  

func _ready() -> void:
	startY = position.y

func _process(delta: float) -> void:
	timeSpent += delta
	position.y = startY + amplitude * sin(speed * timeSpent)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		Global.hasLolli = true
		queue_free()
