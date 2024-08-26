extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _unhandled_input(event):
	if(event.is_action_pressed('esc')):
		get_tree().paused = !get_tree().paused
		visible = !visible


func _on_btn_3_pressed():
	get_tree().quit()


func _on_btn_2_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")


func _on_btn_1_pressed():
	get_tree().paused = false
	visible = !visible


func _on_btn_4_pressed() -> void:
	pass
