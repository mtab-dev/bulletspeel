extends State
class_name SpringIdle

@export var anim: AnimatedSprite2D 

func Enter():
	anim.play('idle')
