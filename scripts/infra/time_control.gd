extends Control

func _process(delta: float) -> void:
	if Global.gameOn == true and !get_tree().paused:
		Global.time += delta
	else:
		pass
