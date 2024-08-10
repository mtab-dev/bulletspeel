extends CanvasLayer

var dialogues: Array = []
var currDialog: String = ''
var charIndex: int = 0

@onready var dialogSprite: Sprite2D = $dialogBox
@onready var dialogLabel: RichTextLabel = $dialogBox/label
@onready var moneyLabel: RichTextLabel = $Panel/moneyLabel

func _process(delta):
	moneyLabel.text = str(Global.money)

func buyItem(price: int, budget: int, item: int):
	if budget >= price:
		Global.money -= price
		if item == 1: 
			dialogLabel.text = "Você comprou o Lolli, faça bom uso"
		elif item == 2:
			dialogLabel.text = "Você vai ser mais rápido do que nunca"
		elif item == 3:
			dialogLabel.text = "Assim como um gato, você pode ter sete vi"
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
	buyItem(10, Global.money, 1)


func _on_item_2_pressed():
	buyItem(5, Global.money, 2)
	


func _on_item_3_pressed():
	buyItem(15, Global.money, 3) 
