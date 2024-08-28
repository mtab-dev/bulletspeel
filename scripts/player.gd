extends CharacterBody2D

@export var speed: int = 10
@onready var animation: AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var collision: CollisionShape2D = $collision
@onready var ammun: Control = get_node("hud/items/ammunation/ammunlabel")
@onready var money: Control = get_node("hud/money/labelMoney")
@onready var stats: Control = get_node("hud/life/control")
@onready var damageFX: AudioStreamPlayer2D = get_node("damageSound")
@onready var walkingFX: AudioStreamPlayer2D = $walkingSound
@onready var deathTimer: Timer = $deathTimer
@onready var lolli: Sprite2D = get_node('hud/items/loli')
const SLINGSHOT= preload('res://scenes/objects/guns/slingshot.tscn')
var moneyCount: int = 0
var hasLolli: bool = false
var isWalking: bool = false
var anim: String = 'idle'

func walkingEffect():
	isWalking = velocity.x != 0 or velocity.y != 0
	if isWalking and not walkingFX.playing:
		walkingFX.play()
	elif !isWalking and walkingFX.playing:
		walkingFX.stop()

func timeAfterDeath():
	deathTimer.wait_time = 1.5
	deathTimer.one_shot = true
	deathTimer.start()

func horizontalMovement() -> void:
	var input_direction: float = Input.get_action_raw_strength("right") - Input.get_action_strength("left")
	velocity.x = input_direction * speed
	if velocity.x != 0:
		isWalking = true
	print(velocity.x)
	
func verticalMovement() -> void:
	var input_direction: float = Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity.y = input_direction * speed
	if velocity.y != 0:
		isWalking = true
	print(velocity.y)
	
func movement():
	if(not Global.isDead):
		verticalMovement()
		horizontalMovement()

func moneyManagement():
	money.text = str(Global.money)
	
func ammunManagement():
	ammun.text = str(Global.ammunation)
	
func updateItems():
	if hasLolli:
		lolli.visible = true

func lifeManagement():
	if(Global.life <= 0):
		Global.isDead = true
		get_tree().paused = true
		collision.disabled = true
		timeAfterDeath()
	stats.updateLife(Global.life)

func _ready():
	pass

func _process(delta):
	updateItems()

func _physics_process(delta):
	ammunManagement()
	moneyManagement()
	lifeManagement()
	animation.animate(velocity, Global.life)
	movement()
	move_and_slide()
	walkingEffect()
	
func _on_death_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/ui/game_over.tscn")


func _on_sling_detect_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		var newSling = SLINGSHOT.instantiate()
		add_child(newSling)
