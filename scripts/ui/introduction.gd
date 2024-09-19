extends Control

@onready var goAheadBtn: Button = $goAhead


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.lang == 'port':
		goAheadBtn.text = 'APERTE AQUI PARA PULAR'
	if Global.lang == 'eng':
		goAheadBtn.text = 'PRESS HERE TO PLAY'
	if Global.lang == 'esp':
		goAheadBtn.text = 'PRESIONE AQUÍ PARA JUGAR'
		



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_go_ahead_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_one.tscn")	
