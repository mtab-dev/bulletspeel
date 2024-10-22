extends State
class_name CookieAttack

@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var player: CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta: float) -> void:
	enemy.velocity = Vector2.ZERO
	texture.play("whiteAttack")


func _on_animated_sprite_2d_animation_finished() -> void:
	if texture.animation == "whiteAttack":
		Transitioned.emit(self, "chase")
