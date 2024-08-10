extends CharacterBody2D

@export var speed: int = 10
@export var animation: AnimatedSprite2D = null
@onready var stats: Control = get_node("hud/life/control")
var isDead: bool = false
var life: int = 3
var anim: String = 'idle'

func horizontalMovement() -> void:
	var input_direction: float = Input.get_action_raw_strength("right") - Input.get_action_strength("left")
	velocity.x = input_direction * speed
	print(velocity.x)
	
func verticalMovement() -> void:
	var input_direction: float = Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity.y = input_direction * speed
	print(velocity.y)
	
func movement():
	if(not isDead):
		verticalMovement()
		horizontalMovement()
	

func lifeManagement():
	if(Input.is_action_just_pressed("left_click")):
		life -= 1
		if(life <= 0):
			isDead = true
	stats.updateLife(life)

func _ready():
	pass
	
func _process(delta):
	pass
	

func _physics_process(delta):
	lifeManagement()
	animation.animate(velocity, life)
	movement()
	move_and_slide()
	print(life)
