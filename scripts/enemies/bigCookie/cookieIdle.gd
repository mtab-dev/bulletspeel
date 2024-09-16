extends State
class_name CookieIdle

var player: CharacterBody2D
var transformTimer: Timer 
var isTransforming: bool = false
@export var enemy: CharacterBody2D 
@export var moveSpeed: int = 5
@export var texture: AnimatedSprite2D

var moveDirection: Vector2
var wanderTime: float

func randomizeWander():
	moveDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wanderTime = randf_range(1, 2)

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
	# Instancia o Timer diretamente no código
	if not transformTimer:
		transformTimer = Timer.new()
		transformTimer.wait_time = 2.0  # Duração da transformação (ajuste conforme necessário)
		transformTimer.one_shot = true  # O timer dispara apenas uma vez
		add_child(transformTimer)  # Adiciona o Timer ao nó atual
		
		# Conecta o sinal 'timeout' do Timer corretamente
		transformTimer.connect("timeout", Callable(self, "_on_transform_timer_timeout"))
	else:
		print("Timer já instanciado.")
	
	if Global.madCookie:
		texture.play('blackIdle')
	else:
		texture.play('whiteIdle')
	randomizeWander()

func Update(delta: float):
	if transformTimer:
		print(transformTimer)
	if wanderTime > 0:
		wanderTime -= delta
	else:
		randomizeWander()

func PhysicsUpdate(_delta: float):
	if isTransforming:
		enemy.velocity = Vector2.ZERO  # Parado durante a transformação
	else:
		if enemy:
			enemy.velocity = moveDirection * moveSpeed
		var direction = player.global_position - enemy.global_position
		if direction.length() < 150:
			Transitioned.emit(self, "chase")
		if Global.madCookie:
			texture.play('blackIdle')
		else:
			texture.play('whiteIdle')

func _process(delta: float) -> void:
	var direction = player.global_position - enemy.global_position

func _on_big_cookie_cookie_transform() -> void:
	if transformTimer:
		print("Iniciando transformação.")
		transformTimer.start()
		isTransforming = true
		texture.play("white2black")  # Animação de transformação
	else:
		print("Timer não está disponível.")

func _on_transform_timer_timeout() -> void:
	isTransforming = false  # A transformação terminou
