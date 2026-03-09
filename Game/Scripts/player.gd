extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED := 150
const ACCELERATE := 15

var inputDirecton := Vector2.ZERO
var facingDirection := "Down"
var animationToPlay := "Idle_"

func _physics_process(delta: float) -> void:
	inputDirecton = Input.get_vector("Left","Right","Up","Down")
	
	velocity = velocity.lerp(inputDirecton * SPEED, ACCELERATE * delta)
	
	move_and_slide()
	
	animationToPlay = "Run_"+GetDirectionName() if velocity.length() > 20 else "Idle_"+GetDirectionName()
	animated_sprite_2d.play(animationToPlay)

func GetDirectionName() -> String:
	if inputDirecton == Vector2.ZERO:
		return facingDirection;
	
	if abs(inputDirecton.y) > abs(inputDirecton.x):
		if inputDirecton.y > 0:
			facingDirection = "Down"
		else:
			facingDirection = "Up"
	else:
		if inputDirecton.x > 0:
			facingDirection = "Right"
		else:
			facingDirection = "Left"
	
	return facingDirection
