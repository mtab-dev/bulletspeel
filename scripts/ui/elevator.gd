extends Area2D

@onready var animation: AnimatedSprite2D = $texture
var player: CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group('Playerasad')
	animation.play('static')



func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		get_tree().paused = true
		player.enterElevator()
		animation.play('opening')
