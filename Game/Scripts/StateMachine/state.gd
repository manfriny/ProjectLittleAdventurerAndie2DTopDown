extends Node
class_name State

var parentStateMachine : StateMachine
var character : BaseCharacter

@warning_ignore("unused_parameter")
func UpdatePhysics(delta: float):
	#print(name + " is updating physics")
	pass


func Update():
	if parentStateMachine.debug_label:
		parentStateMachine.debug_label.text = name


func Enter():
	#print("Entered " + name)
	pass


func Exit():
	#print("Exited " + name)
	pass


func Ready():
	pass
