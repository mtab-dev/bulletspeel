extends Control

func restartGame():
	Global.life = 3
	Global.ammunation = 150
	Global.money = 150
	Global.gameOn = false
	Global.death += 1
	print(Global.death)
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels/level_one.tscn")


func _on_restart_pressed():
	restartGame()
