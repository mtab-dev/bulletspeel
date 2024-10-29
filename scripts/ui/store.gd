extends CanvasLayer

@onready var dialogSprite: Sprite2D = $dialogBox
@onready var dialogLabel: RichTextLabel = $dialogBox/label
@onready var buyLabel: Button = $Panel/buy
@onready var moneyLabel: RichTextLabel = $Panel/moneyLabel
@onready var buySound: AudioStreamPlayer2D = $buySound
@onready var bt1: Button = $Panel/item1
@onready var bt2: Button = $Panel/item2
@onready var bt3: Button = $Panel/item3
@export var player: CharacterBody2D = null
var tween_duration: float = 0.3
var tween_intensity: float = 1.2
var bt1Scale := Vector2.ONE
var bt2Scale := Vector2.ONE
var bt3Scale := Vector2.ONE
var item: int
var budget: int

func startTween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)

func btn_hovered(button: Button, scale):
	button.pivot_offset = button.scale / 2
	if button.is_hovered():
		startTween(button, "scale", scale * tween_intensity, tween_duration)
	else:
		startTween(button, "scale", scale, tween_duration)

func _ready() -> void:
	initText(Global.lang)
	bt1Scale = bt1.scale
	bt2Scale = bt2.scale
	bt3Scale = bt3.scale

func _process(delta):
	moneyLabel.text = str(Global.money)
	btn_hovered(bt1, bt1Scale)
	btn_hovered(bt2, bt2Scale)
	btn_hovered(bt3, bt3Scale)

func initText(lang):
	if lang == 'port':
		dialogLabel.text = "Olá, bem vindo à loja!"
		buyLabel.text = "COMPRAR"
	if lang == 'esp':
		dialogLabel.text = "Bienvenido a la tienda!"
		buyLabel.text = "COMPRAR"
	if lang == 'eng':
		dialogLabel.text = "Welcome to the sugary shop!"
		buyLabel.text = "BUY"

func candyText(lang):
	if lang == 'port':
		dialogLabel.text = "Doce da Vida: +1 de vida"
	if lang == 'esp':
		dialogLabel.text = "Corazon de Azucar: +1 vida!"
	if lang == 'eng':
		dialogLabel.text = "SweetHeart: +1 life!"

func bootsText(lang):
	if lang == 'port':
		dialogLabel.text = "Bota Veloz: +10 de velocidade"
	if lang == 'esp':
		dialogLabel.text = "Bota da Velocidade: +10 velocidad"
	if lang == 'eng':
		dialogLabel.text = "Fast Boots: +10 speed!"

func lolliText(lang):
	if lang == 'port':
		dialogLabel.text = "Lolli: +1 de ataque"
	if lang == 'esp':
		dialogLabel.text = "Lolli: +1 ataque"
	if lang == 'eng':
		dialogLabel.text = "Lolli: +1 attack!"

func mouseHover(lang):
	if lang == 'port':
		dialogLabel.text = "Passe o mouse sobre os itens"
	if lang == 'esp':
		dialogLabel.text = "Coloca el cursor sobre los elementos"
	if lang == 'eng':
		dialogLabel.text = "Hover over items!"

func item1Translate(lang):
	if lang == 'port':
		dialogLabel.text = "Você comprou o Lolli, faça bom uso"
	if lang == 'esp':
		dialogLabel.text = "Usted compraste Lolli!"
	if lang == 'eng':
		dialogLabel.text = "You've bought the Lolli, good luck!"

func item2Translate(lang):
	if lang == 'port':
		dialogLabel.text = "Você vai ser mais rápido do que nunca"
	if lang == 'esp':
		dialogLabel.text = "Usted eres la velocidad!"
	if lang == 'eng':
		dialogLabel.text = "You're gonna be the fastest man alive!"

func item3Translate(lang):
	if lang == 'port':
		dialogLabel.text = "Assim como um gato, você tem 7 vidas"
	if lang == 'esp':
		dialogLabel.text = "Usted tienes muchas vidas, eres inmortal!"
	if lang == 'eng':
		dialogLabel.text = "Like a cat, you got seven lives!"

func alreadyMax(lang):
	if lang == 'port':
		dialogLabel.text = "Voce ja esta bem de vida"
	if lang == 'esp':
		dialogLabel.text = "Ya eres inmortal, vampiro."
	if lang == 'eng':
		dialogLabel.text = "Life is not a candy that you can but anytime"
	buyLabel.add_theme_color_override("font_color", Color(1, 0, 0))

func budgetTranslate(lang):
	if lang == 'port':
		dialogLabel.text = "Saldo Insuficiente!"
	if lang == 'esp':
		dialogLabel.text = "No tienes la plata!"
	if lang == 'eng':
		dialogLabel.text = "You can't buy this, you're poor!"

func buyItem(price: int, budget: int, item: int):
	if budget >= price:
		buySound.play()
		Global.money -= price
		if item == 1: 
			item1Translate(Global.lang)
			Global.life += 1
			Global.hasLolli = true
		elif item == 2:
			item2Translate(Global.lang)
			player.speed = 300
			Global.hasBoots = true
		elif item == 3:
			if Global.life < 3:
				item3Translate(Global.lang)
				Global.life += 1
			else:
				alreadyMax(Global.lang)
	else:
		budgetTranslate(Global.lang)

func _on_exit_pressed():
	get_node("animation").play("transOut")
	get_tree().paused = false

func _on_item_1_mouse_entered():
	lolliText(Global.lang)
	buyLabel.add_theme_color_override("font_color", Color(1, 1, 1))

func _on_item_1_mouse_exited():
	mouseHover(Global.lang)

func _on_item_2_mouse_entered():
	bootsText(Global.lang)
	buyLabel.add_theme_color_override("font_color", Color(1, 1, 1))

func _on_item_2_mouse_exited():
	mouseHover(Global.lang)

func _on_item_3_mouse_entered():
	if Global.life < 3:
		candyText(Global.lang)
	else:
		bt3.add_theme_color_override("icon", Color(1, 0, 0))
		alreadyMax(Global.lang)

func _on_item_3_mouse_exited():
	mouseHover(Global.lang)
	if item != 3:
		buyLabel.add_theme_color_override("font_color", Color(1, 1, 1))
	

func _on_item_1_pressed():
	lolliText(Global.lang)
	budget = 10
	item = 1

func _on_item_2_pressed():
	bootsText(Global.lang)
	budget = 5
	item = 2

func _on_item_3_pressed():
	candyText(Global.lang)
	budget = 15
	item = 3

func _on_buy_pressed() -> void:
	buyItem(budget, Global.money, item)
