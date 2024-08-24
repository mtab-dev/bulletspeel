extends Node
@onready var player = $player
@onready var interactFX: AudioStreamPlayer2D = $interactFX
@onready var ambientFX: AudioStreamPlayer2D = $ambientMusic
@onready var slingDetect: Area2D = $slingDetect
@onready var slingAnim: AnimatedSprite2D = $slingDetect/slingTexture
@onready var slingLabel: Label = $slingDetect/slingLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	slingAnim.play('default')
	ambientFX.loop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.life <= 0:
		player.isDead = true
		player.timeAfterDeath()



func _on_chest_1_body_entered(body):
	if body.is_in_group('Player'):
		var chest = get_node('lvlDesign/collision/chest1/chest')
		if chest:
			chest.queue_free()


func _on_chest_2_body_entered(body):
	if body.is_in_group('Player'):
		var chest = get_node('lvlDesign/collision/chest2/chest2')
		if chest:
			chest.queue_free()



func _on_chest_3_body_entered(body):
	if body.is_in_group('Player'):
		var chest = get_node('lvlDesign/collision/chest3/chest3')
		if chest:
			chest.queue_free()


func _on_sling_detect_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		interactFX.play()
		slingDetect.queue_free()


func _on_sling_detect_body_exited(body: Node2D) -> void:
	slingLabel.visible = false
