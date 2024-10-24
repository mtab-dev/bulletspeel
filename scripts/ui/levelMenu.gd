extends CanvasLayer

@onready var resumeButton: Button = $VBoxContainer/btn1
@onready var restartButton: Button = $VBoxContainer/btn4
@onready var mainMenuButton: Button = $VBoxContainer/btn2
@onready var quitButton: Button = $VBoxContainer/btn3

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false;
	if Global.lang == 'port':
		resumeButton.text = 'CONTINUAR'
		restartButton.text = 'REINICIAR'
		mainMenuButton.text = 'MENU PRINCIPAL'
		quitButton.text = 'SAIR'
	if Global.lang == 'eng':
		resumeButton.text = 'RESUME'
		restartButton.text = 'RESTART'
		mainMenuButton.text = 'MAIN MENU'
		quitButton.text = 'QUIT'
	if Global.lang == 'esp':
		resumeButton.text = 'CONTINUAR'
		restartButton.text = 'REANUDAR'
		mainMenuButton.text = 'MENU PRINCIPAL'
		quitButton.text = 'SALIR'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _unhandled_input(event):
	if(event.is_action_pressed('esc')):
		get_tree().paused = !get_tree().paused
		visible = !visible


func _on_btn_3_pressed():
	get_tree().quit()


func _on_btn_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")


func _on_btn_1_pressed():
	get_tree().paused = false
	visible = !visible


func _on_btn_4_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels/level_one.tscn")
