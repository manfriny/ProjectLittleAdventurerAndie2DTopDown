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
		if character.showDebugVisual:
			parentStateMachine.debug_label.text = name
		else :
			parentStateMachine.debug_label.visible = false


func Enter():
	#print("Entered " + name)
	pass


func Exit():
	#print("Exited " + name)
	pass


func Ready():
	pass
