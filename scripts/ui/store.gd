extends CanvasLayer

var item: int
var budget: int

@onready var dialogSprite: Sprite2D = $dialogBox
@onready var dialogLabel: RichTextLabel = $dialogBox/label
@onready var buyLabel: Button = $Panel/buy
@onready var moneyLabel: RichTextLabel = $Panel/moneyLabel
@onready var buySound: AudioStreamPlayer2D = $buySound
@export var player: CharacterBody2D = null



func _ready() -> void:
	initText(Global.lang)

func _process(delta):
	moneyLabel.text = str(Global.money)

func initText(lang):
	if lang == 'port':
		dialogLabel.text = "Olá, bem vindo à loja!"
		buyLabel.text = "COMPRAR"
	if lang == 'esp':
		dialogLabel.text = "Bienvenido a la	tienda!"
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
		dialogLabel.text = "You're gonna be the fatest man alive!"

func item3Translate(lang):
	if lang == 'port':
		dialogLabel.text = "Assim como um gato, você tem 7 vidas"
	if lang == 'esp':
		dialogLabel.text = "Usted tienes muchas vidas, eres imortal!"
	if lang == 'eng':
		dialogLabel.text = "Like a cat, you got seven lifes!"

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
			item3Translate(Global.lang)
			Global.life += 1
	else:
		budgetTranslate(Global.lang)

func _on_exit_pressed():
	get_node("animation").play("transOut")
	get_tree().paused = false;

func _on_item_1_mouse_entered():
	lolliText(Global.lang)

func _on_item_1_mouse_exited():
	mouseHover(Global.lang)


func _on_item_2_mouse_entered():
	bootsText(Global.lang)


func _on_item_2_mouse_exited():
	mouseHover(Global.lang)


func _on_item_3_mouse_entered():
	candyText(Global.lang)


func _on_item_3_mouse_exited():
	mouseHover(Global.lang)

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
