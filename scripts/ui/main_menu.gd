extends Control

@onready var menu: Control = get_node("menu")
@onready var button_container: VBoxContainer = menu.get_node("menu/buttonContainer")
#@onready var continue_button: Button = button_container.get_node("continue")

func _ready():
	#var file: File = File.new()
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_one.tscn")


func _on_sair_pressed():
	get_tree().quit()
