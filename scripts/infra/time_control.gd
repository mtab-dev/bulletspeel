extends Control

func _ready() -> void:
	print('to aq')

func _process(delta: float) -> void:
	if Global.gameOn == true and !get_tree().paused:
		Global.time += delta
	else:
		pass
