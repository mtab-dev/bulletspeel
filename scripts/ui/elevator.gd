extends Area2D

@onready var animation: AnimatedSprite2D = $texture
@onready var elevatorEntry: Marker2D = $Marker2D
@onready var timer: Timer = $timerAfterDeath

var player: CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group('Player')
	animation.play('static')



func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		if(Global.deadCookie):
			get_tree().paused = true
			player.enterElevator(elevatorEntry.global_position)
			animation.play('opening')
			timer.start()


func _on_timer_after_death_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/betaEnd.tscn")
