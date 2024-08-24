extends CanvasLayer

@onready var joystick: CanvasLayer = $"Test/UI"

# Called when the node enters the scene tree for the first time.
func _ready():
	if(OS.get_name() == 'Android'):
		joystick.visible = true
	else:
		joystick.visible = false
	print(OS.get_name())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
