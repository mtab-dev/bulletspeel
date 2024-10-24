extends Control

class_name PlayerStats
@export var life: int = 3
@export var spr1: TextureRect = null
@export var spr2: TextureRect = null
@export var spr3: TextureRect = null


func _ready():
	life = 3
	

func hideLife():
	if get_tree().paused:
		spr1.visible = false
		spr2.visible = false
		spr3.visible = false


func updateLife(life):
	if(life == 2):
		spr3.texture = load("res://sprites/ui/hud/sugar-destroyed.png")
	if(life == 1):
		spr2.texture = load("res://sprites/ui/hud/sugar-destroyed.png")
	if(life == 0):
		spr1.texture = load("res://sprites/ui/hud/sugar-destroyed.png")

func _process(delta):
	hideLife()
	updateLife(life)
