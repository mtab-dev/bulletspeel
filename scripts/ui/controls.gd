extends CanvasLayer

@onready var anim: AnimationPlayer = $animation

func _on_button_pressed():
	get_tree().paused = false
	anim.play('transOut')
