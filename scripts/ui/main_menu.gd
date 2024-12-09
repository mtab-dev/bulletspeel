extends Control

@onready var menu: Control = get_node("menu")
@onready var bgroundSprite: AnimatedSprite2D = get_node("bground")
@onready var clickSound: AudioStreamPlayer2D = $buttonClick
@onready var sceneMorph: AudioStreamPlayer2D = $sceneMorph
@onready var changeTimer: Timer = $sceneChangingTimer
@onready var controlOverlay: AnimationPlayer = $controlOverlay/animation
@onready var optionsOverlay: AnimationPlayer = $OptionsOverlay/animation
@onready var optionsTable: CanvasLayer = $OptionsOverlay
#botões
@onready var playButton: Button = $menu/play
@onready var exitButton: Button = $menu/sair
@onready var optionsButton: Button = $"menu/opções"
@onready var controlsButton: Button = $"menu/controls"
var path: String
var canTrackInput: bool = true

func _ready():
	optionsTable.offset.y = -1000
	bgroundSprite.play("menu-anim")
	print_rich("[color=green]BulletSpeel by FromHel Studio![/color]")

	
func _process(delta: float) -> void:
	if Global.lang == 'eng':
		playButton.icon = load("res://sprites/ui/menu/playEng.webp")
		exitButton.icon = load("res://sprites/ui/menu/exitEng.webp")
		optionsButton.icon = load("res://sprites/ui/menu/optionEng.webp")
		controlsButton.icon = load("res://sprites/ui/menu/controlEng.webp")
	if Global.lang == 'port':
		playButton.icon = load("res://sprites/ui/menu/play_button.webp")
		exitButton.icon = load("res://sprites/ui/menu/exit_button.webp")
		optionsButton.icon = load("res://sprites/ui/menu/options.webp")
		controlsButton.icon = load("res://sprites/ui/menu/control_button.webp")
	if Global.lang == 'esp':
		playButton.icon = load("res://sprites/ui/menu/jugar.webp")
		exitButton.icon = load("res://sprites/ui/menu/salir.webp")
		optionsButton.icon = load("res://sprites/ui/menu/opciones.webp")
		controlsButton.icon = load("res://sprites/ui/menu/control_button.webp")


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
	get_tree().paused = true
	if canTrackInput:
		path = 'controls'
		clickSound.play()
		optionsOverlay.play('transIn')


func _on_scene_changing_timer_timeout():
	if path == 'play':
		get_tree().change_scene_to_file("res://scenes/ui/chosePlayer.tscn")
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


func _on_controles_pressed() -> void:
	get_tree().paused = true
	if canTrackInput:
		path = 'controls'
		clickSound.play()
		controlOverlay.play('transIn')
