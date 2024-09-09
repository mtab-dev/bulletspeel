extends StaticBody2D

@onready var col: CollisionShape2D = $collisorOne
@onready var anim: AnimatedSprite2D = $animation
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play('closed')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_detection_entry_body_entered(body: Node2D) -> void:
	anim.play('opening')


func _on_detection_entry_body_exited(body: Node2D) -> void:
	anim.play('closing')
