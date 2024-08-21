extends CanvasLayer

@onready var anim: AnimationPlayer = $animation

func _on_button_pressed():
	anim.play('transOut')
