extends CanvasLayer

var item: int
var budget: int

@onready var dialogSprite: Sprite2D = $dialogBox
@onready var dialogLabel: RichTextLabel = $dialogBox/label
@onready var moneyLabel: RichTextLabel = $Panel/moneyLabel
@onready var buySound: AudioStreamPlayer2D = $buySound
@export var player: CharacterBody2D = null

func _process(delta):
	moneyLabel.text = str(Global.money)

func buyItem(price: int, budget: int, item: int):
	if budget >= price:
		buySound.play()
		Global.money -= price
		if item == 1: 
			dialogLabel.text = "Você comprou o Lolli, faça bom uso"
			Global.life += 1
			Global.hasLolli = true
		elif item == 2:
			dialogLabel.text = "Você vai ser mais rápido do que nunca"
			player.speed = 300
			Global.hasBoots = true
		elif item == 3:
			dialogLabel.text = "Assim como um gato, você pode ter sete vidas"
			Global.life += 1
	else:
		dialogLabel.text = 'Seu saldo é insuficiente!'

func _on_exit_pressed():
	get_node("animation").play("transOut")
	get_tree().paused = false;

func _on_item_1_mouse_entered():
	dialogLabel.text = "Lolli -> + 2 de ataque"

func _on_item_1_mouse_exited():
	dialogLabel.text = "Passe o mouse sobre os itens!"


func _on_item_2_mouse_entered():
	dialogLabel.text = "Bota Veloz -> + 2 de Velocidade"


func _on_item_2_mouse_exited():
	dialogLabel.text = "Passe o mouse sobre os itens!"

func _on_item_3_mouse_entered():
	dialogLabel.text = "Doce Vida -> + 1 de Vida"


func _on_item_3_mouse_exited():
	dialogLabel.text = "Passe o mouse sobre os itens!"	


func _on_item_1_pressed():
	dialogLabel.text = "Lolli -> + 2 de ataque"
	budget = 10
	item = 1


func _on_item_2_pressed():
	dialogLabel.text = "Bota Veloz -> + 2 de Velocidade"
	budget = 5
	item = 2
	


func _on_item_3_pressed():
	dialogLabel.text = "Doce Vida -> + 1 de Vida"
	budget = 15
	item = 3


func _on_buy_pressed() -> void:
	buyItem(budget, Global.money, item)
