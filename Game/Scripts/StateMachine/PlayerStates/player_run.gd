extends State

const SPEED := 150
const ACCELERATE := 15

func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	
	if character.inputDirecton == Vector2.ZERO:
		parentStateMachine.SwitchTo("Idle") 
		return
	
	character.velocity = character.velocity.lerp(character.inputDirecton * SPEED, ACCELERATE * delta)
	character.move_and_slide()


func Update():
	super.Update()
	character.UpdateAnimation()
