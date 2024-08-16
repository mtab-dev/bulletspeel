extends CharacterBody2D

@export var speed: int = 10
@onready var animation: AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var money: Control = get_node("hud/money/labelMoney")
@onready var stats: Control = get_node("hud/life/control")
@onready var damageFX: AudioStreamPlayer2D = get_node("damageSound")
@onready var deathTimer: Timer = $deathTimer
@onready var lolli: Sprite2D = get_node('hud/items/loli')
var moneyCount: int = 0
var hasLolli: bool = false
var isDead: bool = false
var anim: String = 'idle'


func timeAfterDeath():
	deathTimer.wait_time = 2.0
	deathTimer.one_shot = true
	deathTimer.start()

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

func moneyManagement():
	if Input.is_action_just_pressed("shift"):
		Global.money += 1
		money.text = str(Global.money)
	money.text = str(Global.money)
	
func updateItems():
	if hasLolli:
		lolli.visible = true

func lifeManagement():
	if(Input.is_action_just_pressed("space")):
		Global.life -= 1
		damageFX.play()
		if(Global.life <= 0):
			get_tree().paused = true
			isDead = true
			timeAfterDeath()
	stats.updateLife(Global.life)

func _ready():
	pass

func _process(delta):
	updateItems()

func _physics_process(delta):
	moneyManagement()
	lifeManagement()
	animation.animate(velocity, Global.life)
	movement()
	move_and_slide()


func _on_death_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/ui/game_over.tscn")
