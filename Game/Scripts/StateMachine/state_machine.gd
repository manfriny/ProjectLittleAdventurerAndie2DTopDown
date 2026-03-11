extends Node
class_name StateMachine

var currentState: State

func _ready() -> void:
	
	for child in get_children():
		var childState = child as State
		childState.parentStateMachine = self
		childState.Ready()
	
	#starta no state de indice zero, que é o primeiro item abaixo de StateMachine: IDLE
	currentState = get_child(0)
	currentState.Enter()


func _physics_process(delta: float) -> void:
	currentState.UpdatePhysics(delta)


func _process(_delta: float) -> void:
	currentState.Update()
