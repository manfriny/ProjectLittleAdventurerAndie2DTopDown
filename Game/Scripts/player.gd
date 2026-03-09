extends CharacterBody2D

const SPEED := 150
const ACCELERATE := 15

var inputDirecton := Vector2.ZERO

func _physics_process(delta: float) -> void:
	inputDirecton = Input.get_vector("Left","Right","Up","Down")
	
	velocity = velocity.lerp(inputDirecton * SPEED, ACCELERATE * delta)
	
	move_and_slide()
