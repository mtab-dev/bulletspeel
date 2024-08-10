extends Node
class_name StateMachine

@export var initialState: State
var currentState: State
@export var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(onChildTransition)
	if initialState:
		initialState.Enter()
		currentState = initialState
	
func _process(delta):
	if currentState:
		currentState.Update(delta)
	
func _physics_process(delta):
	if currentState:
		currentState.PhysicsUpdate(delta)
		
func onChildTransition(state, newStateName):
	if state != currentState:
		return
	var newState = state.get(newStateName.to_lower())
	if !newState:
		return
	if currentState:
		currentState.exit()
	newState.enter()
	currentState = newState
	print("Conectado ao sinal de transição para o estado: ", currentState)


func _on_detection_area_body_entered(body):
	if body.is_in_group("Player"):
		onChildTransition(currentState, "chase")
