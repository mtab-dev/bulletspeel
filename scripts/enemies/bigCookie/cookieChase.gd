extends State
class_name CookieChase

@export var moveSpeed = 80
@export var enemy: CharacterBody2D
@export var texture: AnimatedSprite2D
var transformTimer: Timer
var isTransforming: bool = false
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")

	# Verifica se o Timer já foi criado
	if not transformTimer:
		transformTimer = Timer.new()
		transformTimer.wait_time = 2.0  # Ajusta o tempo conforme necessário
		transformTimer.one_shot = true  # Define como uma vez
		add_child(transformTimer)  # Adiciona o Timer ao nó
		transformTimer.connect("timeout", Callable(self, "_on_transform_timer_timeout"))
	else:
		print("Timer já instanciado.")

func PhysicsUpdate(_delta: float):
	if isTransforming:
		enemy.velocity = Vector2.ZERO  # Parado durante a transformação
	else:
		var direction = player.global_position - enemy.global_position
		var distance = direction.length()
		if distance > 150:
			enemy.velocity = direction.normalized() * moveSpeed
			if Global.madCookie:
				texture.play("blackRun")
			else:
				texture.play("whiteRun")
		if distance > 300:
			Transitioned.emit(self, "idle")

func _on_big_cookie_cookie_transform() -> void:
	if transformTimer:
		transformTimer.start()  # Inicia o timer para a transformação
		isTransforming = true
		texture.play("white2black")  # Toca a animação de transformação
	else:
		print("Timer não está disponível.")

func _on_transform_timer_timeout() -> void:
	isTransforming = false  # A transformação terminou
