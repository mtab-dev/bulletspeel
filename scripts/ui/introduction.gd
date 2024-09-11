extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		get_tree().change_scene_to_file("res://scenes/levels/level_one.tscn")
	if event is InputEventKey and event.pressed:
		get_tree().change_scene_to_file("res://scenes/levels/level_one.tscn")


func _on_go_ahead_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_one.tscn")
	
