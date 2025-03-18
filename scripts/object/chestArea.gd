extends Node

@onready var chestOne: Area2D = $chst1
@onready var chestTwo: Area2D = $chst2
@onready var chestThree: Area2D = $chst3
const LOLLI = preload('res://scenes/objects/drops/lolli.tscn')
const BOOTS = preload('res://scenes/objects/drops/boots.tscn')
const MIMIC = preload('res://scenes/enemies/mimic.tscn')

var avaibleDrop = ['mimic', 'lolli', 'boot']

func spawnMimic(position):
	var spawnPoint = position
	var newMimic = MIMIC.instantiate()
	newMimic.position = spawnPoint
	get_tree().current_scene.add_child(newMimic)

func dropLolli(position):
	var drop_position = position
	var newLolli = LOLLI.instantiate()
	newLolli.position = drop_position
	get_tree().current_scene.add_child(newLolli)
	
func dropBoots(position):
	var drop_position = position
	var newBoots = BOOTS.instantiate()
	newBoots.position = drop_position
	get_tree().current_scene.add_child(newBoots)

func randomDrop(position):
	if avaibleDrop.size() == 0:
		print("Todos os itens já foram dropados.")
		return
	var randomIndex = randi() % avaibleDrop.size()
	var selectDrop = avaibleDrop[randomIndex]
	match selectDrop:
		"mimic":
			spawnMimic(position)
		"lolli":
			dropLolli(position)
		"boot":
			dropBoots(position)
	avaibleDrop.remove_at(randomIndex)

func detectHit(chest):
	randomDrop(chest.global_position)
	chest.queue_free()

func _on_chst_1_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		detectHit(chestOne)

func _on_chst_2_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		detectHit(chestTwo)

func _on_chst_3_area_entered(area: Area2D) -> void:
	if area.is_in_group('Bullets'):
		detectHit(chestThree)
