extends ProgressBar

@onready var timer = $Timer
@onready var damageBar = $damageBar

var health = 0 : set = setHealth

func setHealth(newHealth):
	var prevHealth = health
	health = min(max_value, newHealth)
	value = health
	
	if health <= 0:
		queue_free()
		
	if health < prevHealth:
		timer.start()
	else:
		damageBar.value = health

func initHealth(_health):
	health = _health
	max_value = health
	value = health
	damageBar.max_value = health
	value = health


func _on_timer_timeout() -> void:
	damageBar.value = health
