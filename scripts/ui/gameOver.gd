extends Control

func restartGame():
	OS.shell_open(OS.get_executable_path())
	get_tree().quit()  


func _on_restart_pressed():
	restartGame()
