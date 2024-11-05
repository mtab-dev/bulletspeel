extends CanvasLayer

@onready var idiomBtn: Button = $Panel/idiomeBtn
@onready var closeBtn: Button = $Panel/closeBtn
@onready var musicBtn: Button = $Panel/musicBtn
@onready var fxBtn: Button = $Panel/fxBtn
@onready var selectFx: AudioStreamPlayer2D = $selectButton
@onready var anim: AnimationPlayer = $animation

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.lang == 'port':
		idiomBtn.text = 'IDIOMA:'
		closeBtn.text = 'FECHAR'
		musicBtn.text = 'MUSICA'
		fxBtn.text = 'EFEITOS'
	if Global.lang == 'eng':
		idiomBtn.text = 'LANGUAGE:'
		closeBtn.text = 'CLOSE'
		musicBtn.text = 'MUSIC'
		fxBtn.text = 'EFFECTS'
	if Global.lang == 'esp':
		idiomBtn.text = 'IDIOMA:'
		closeBtn.text = 'CERRAR'
		musicBtn.text = 'MUSICA'
		fxBtn.text = 'EFECTOS'
		
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
	get_tree().paused = false
	anim.play('transOut')
