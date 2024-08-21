extends Node
@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
