extends CharacterBody2D

@export var speed: int = 10
@export var animation: AnimatedSprite2D = null


func horizontalMovement() -> void:
	var input_direction: float = Input.get_action_raw_strength("right") - Input.get_action_strength("left")
	velocity.x = input_direction * speed
	if velocity.x != 0:
		animation.play('run')
		animation.flip_h = (velocity.x < 0)
	print(velocity.x)
	
func verticalMovement() -> void:
	var input_direction: float = Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity.y = input_direction * speed
	if(velocity.y == 0):
		animation.play("idle")
	if(velocity.y < 0):
		animation.play("up")
	elif(velocity.y > 0):
		animation.play("down")
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
