extends CanvasLayer

var dialogues: Array = []
var currDialog: String = ''
var charIndex: int = 0

@onready var dialogSprite: Sprite2D = $dialogBox
@onready var dialogLabel: RichTextLabel = $dialogBox/label
@onready var moneyLabel: RichTextLabel = $Panel/moneyLabel

func _process(delta):
	moneyLabel.text = str(Global.money)


func _on_exit_pressed():
	get_node("animation").play("transOut")
	get_tree().paused = false;

func _on_item_1_mouse_entered():
	dialogLabel.text = "Lolli -> + 2 de ataque"

func _on_item_1_mouse_exited():
	dialogLabel.text = "Passe o mouse sobre os itens!"


func _on_item_2_mouse_entered():
	dialogLabel.text = "Bola Veloz - + 2 de Velocidade"


func _on_item_2_mouse_exited():
	dialogLabel.text = "Passe o mouse sobre os itens!"

func _on_item_3_mouse_entered():
	dialogLabel.text = "Doce Vida! + 1 de Vida"


func _on_item_3_mouse_exited():
	dialogLabel.text = "Passe o mouse sobre os itens!"	
