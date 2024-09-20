extends CanvasLayer

@onready var idiomBtn: Button = $Panel/idiomeBtn
@onready var closeBtn: Button = $Panel/closeBtn
@onready var selectFx: AudioStreamPlayer2D = $selectButton
@onready var anim: AnimationPlayer = $animation

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.lang == 'port':
		idiomBtn.text = 'IDIOMA:'
		closeBtn.text = 'FECHAR'
	if Global.lang == 'eng':
		idiomBtn.text = 'LANGUAGE:'
		closeBtn.text = 'CLOSE'
	if Global.lang == 'esp':
		idiomBtn.text = 'IDIOMA:'
		closeBtn.text = 'CERRAR'

func _on_br_btn_pressed() -> void:
	Global.lang = 'port'
	selectFx.play()


func _on_esp_btn_pressed() -> void:
	Global.lang = 'esp'
	selectFx.play()


func _on_eng_btn_pressed() -> void:
	Global.lang = 'eng'
	selectFx.play()


func _on_close_btn_pressed() -> void:
	anim.play('transOut')
