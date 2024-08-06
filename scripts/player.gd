extends CharacterBody2D

@export var speed: int = 10

func horizontalMovement() -> void:
	var input_direction: float = Input.get_action_raw_strength("right") - Input.get_action_strength("left") 
	velocity.x = input_direction * speed
	print(velocity.x)
	
func verticalMovement() -> void:
	var input_direction: float = Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity.y = input_direction * speed
	print(velocity.y)
	
func movement():
	verticalMovement()
	horizontalMovement()



func _ready():
	pass
	
func _process(delta):
	pass
	

func _physics_process(delta):
	movement()
	move_and_slide()
