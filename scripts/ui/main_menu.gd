extends Control

@onready var menu: Control = get_node("menu")
@onready var bgroundSprite: AnimatedSprite2D = get_node("bground")
@onready var clickSound: AudioStreamPlayer2D = $buttonClick
@onready var sceneMorph: AudioStreamPlayer2D = $sceneMorph
@onready var changeTimer: Timer = $sceneChangingTimer
@onready var controlOverlay: AnimationPlayer = $controlOverlay/animation
@onready var optionsOverlay: AnimationPlayer = $OptionsOverlay/animation
var path: String
var canTrackInput: bool = true

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
	canTrackInput = false


func _on_sair_pressed():
	if canTrackInput:
		path = 'quit'
		clickSound.play()
		timerAwait(0.1)

func _on_opções_pressed():
	if canTrackInput:
		path = 'controls'
		clickSound.play()
		optionsOverlay.play('transIn')


func _on_scene_changing_timer_timeout():
	if path == 'play':
		get_tree().change_scene_to_file("res://scenes/ui/introduction.tscn")	
	elif path == 'controls':
		get_tree().change_scene_to_file("res://scenes/levels/controls.tscn")
	elif path == 'quit':
		get_tree().quit()


func _on_esp_pressed() -> void:
	Global.lang = "esp"


func _on_eng_pressed() -> void:
	Global.lang = "eng"


func _on_port_pressed() -> void:
	Global.lang = "port"
