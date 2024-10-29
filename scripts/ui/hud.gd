extends Control

class_name PlayerStats
@export var spr1: TextureRect = null
@export var spr2: TextureRect = null
@export var spr3: TextureRect = null

func updateLife():
	if(Global.life == 3):
		spr3.texture = load("res://sprites/ui/hud/sugar-life.png")
		spr2.texture = load("res://sprites/ui/hud/sugar-life.png")
		spr1.texture = load("res://sprites/ui/hud/sugar-life.png")
	if(Global.life == 2):
		spr3.texture = load("res://sprites/ui/hud/sugar-destroyed.png")
		spr2.texture = load("res://sprites/ui/hud/sugar-life.png")
		spr1.texture = load("res://sprites/ui/hud/sugar-life.png")
	if(Global.life == 1):
		spr3.texture = load("res://sprites/ui/hud/sugar-destroyed.png")
		spr2.texture = load("res://sprites/ui/hud/sugar-destroyed.png")
		spr1.texture = load("res://sprites/ui/hud/sugar-life.png")
	if(Global.life == 0):
		spr3.texture = load("res://sprites/ui/hud/sugar-destroyed.png")
		spr2.texture = load("res://sprites/ui/hud/sugar-destroyed.png")
		spr1.texture = load("res://sprites/ui/hud/sugar-destroyed.png")

func _process(delta):
	updateLife()
