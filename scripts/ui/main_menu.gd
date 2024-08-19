extends Control

@onready var menu: Control = get_node("menu")
@onready var bgroundSprite: AnimatedSprite2D = get_node("bground")
@onready var clickSound: AudioStreamPlayer2D = $buttonClick
@onready var sceneMorph: AudioStreamPlayer2D = $sceneMorph
@onready var changeTimer: Timer = $sceneChangingTimer
var path: String

func _ready():
	bgroundSprite.play("menu-anim")


func timerAwait(time: float):
	changeTimer.wait_time = time
	changeTimer.one_shot = true
	changeTimer.start()

func _on_play_pressed():
	path = 'play'
	sceneMorph.play()
	timerAwait(0.6)


func _on_sair_pressed():
	path = 'quit'
	clickSound.play()
	timerAwait(0.9)

func _on_opções_pressed():
	path = 'controls'
	clickSound.play()
	timerAwait(0.9)


func _on_scene_changing_timer_timeout():
	if path == 'play':
		get_tree().change_scene_to_file("res://scenes/ui/introduction.tscn")	
	elif path == 'controls':
		get_tree().change_scene_to_file("res://scenes/levels/controls.tscn")
	elif path == 'quit':
		get_tree().quit()
