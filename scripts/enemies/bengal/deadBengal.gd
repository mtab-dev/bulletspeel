extends State
class_name DeadBengal

@export var enemy: CharacterBody2D
@export var anim: AnimatedSprite2D
const COIN = preload("res://scenes/objects/drops/coin.tscn")
const AMMUN = preload("res://scenes/objects/drops/ammunation.tscn")

func dropCoin():
	var drop_position = enemy.global_position
	var newCoin = COIN.instantiate()
	newCoin.position = drop_position
	get_tree().current_scene.add_child(newCoin)  

func dropAmmun():
	var drop_position = enemy.global_position
	var newAmmun = AMMUN.instantiate()
	newAmmun.position = drop_position
	get_tree().current_scene.add_child(newAmmun)

func randomDrop():
	var randomize = randi() % 2  
	if randomize == 0:
		dropCoin()
	else:
		dropAmmun()

func Enter() -> void:
	enemy.velocity = Vector2.ZERO
	anim.play("death")

func _on_bengal_animation_animation_finished() -> void:
	if anim.animation == "death":
		randomDrop()
		enemy.queue_free()
