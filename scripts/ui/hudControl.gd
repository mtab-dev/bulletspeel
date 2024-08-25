extends CanvasLayer

@onready var joystick: CanvasLayer = $"Test/UI"
@onready var pauseButton: Button = $Test/UI/pauseScene
@onready var levelMenu: CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	levelMenu = get_tree().get_first_node_in_group('levelMenu')
	if(OS.get_name() == 'Android'):
		joystick.visible = true
	else:
		joystick.visible = false
	print(OS.get_name())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if levelMenu.visible:
		pauseButton.visible = false
	else:
		pauseButton.visible = true



func _on_pause_scene_pressed() -> void:
	get_tree().paused = true
	levelMenu.visible = !levelMenu.visible
	
