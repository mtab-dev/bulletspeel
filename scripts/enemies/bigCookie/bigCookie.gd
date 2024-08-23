extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $animation

func _ready() -> void:
	animation.play('whiteIdle')
