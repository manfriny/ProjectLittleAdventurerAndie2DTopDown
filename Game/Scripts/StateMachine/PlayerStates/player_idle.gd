extends State

func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	
	if character.inputDirecton.length() > 0:
		parentStateMachine.SwitchTo("Run")


func Update():
	super.Update()
