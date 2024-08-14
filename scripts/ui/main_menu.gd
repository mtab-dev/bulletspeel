extends Control

@onready var menu: Control = get_node("menu")
@onready var bgroundSprite: AnimatedSprite2D = get_node("bground")
#@onready var continue_button: Button = button_container.get_node("continue")

func _ready():
	bgroundSprite.play("menu-anim")
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/introduction.tscn")


func _on_sair_pressed():
	get_tree().quit()


func _on_opções_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/controls.tscn")
