extends Control

@onready var anim: AnimatedSprite2D = $anim
@onready var pageLabel: Button = $label
@onready var midColor: Button = $midColor
@onready var whiteColor: Button = $whiteColor
@onready var startBtn: Button = $startBtn
@onready var selectFx: AudioStreamPlayer2D = $select

func _ready():
	anim.play('whiteIdle')
	if Global.lang == 'port':
		pageLabel.text = 'ESCOLHA A COR DO SEU PLAYER'
		startBtn.text = 'JOGAR'
	if Global.lang == 'eng':
		pageLabel.text = 'CHOOSE YOUR PLAYER COLOR'
		startBtn.text = 'PLAY'
	if Global.lang == 'esp':
		pageLabel.text = 'ELIGE EL COLOR DE TU JUGADOR'
		startBtn.text = 'JUGAR'


func _on_white_color_pressed() -> void:
	Global.playerColor = 'W'
	anim.play('whiteIdle')


func _on_mid_color_pressed() -> void:
	Global.playerColor = 'M'
	anim.play('midIdle')



func _on_start_btn_pressed() -> void:
	selectFx.play()
	get_tree().change_scene_to_file("res://scenes/ui/introduction.tscn")
