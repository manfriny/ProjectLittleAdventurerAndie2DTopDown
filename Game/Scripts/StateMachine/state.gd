extends Node
class_name State

var parentStateMachine : StateMachine

@warning_ignore("unused_parameter")
func UpdatePhysics(delta: float):
	#print(name + " is updating physics")
	pass


func Update():
	#print(name + " is updating")
	pass


func Enter():
	pass


func Exit():
	pass


func Ready():
	pass
