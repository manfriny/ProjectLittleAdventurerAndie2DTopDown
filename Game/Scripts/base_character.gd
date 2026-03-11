extends CharacterBody2D

class_name BaseCharacter

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $StateMachine

var inputDirecton : Vector2 = Vector2.ZERO
var facingDirection : String = "Down"
var animationToPlay : String = "Idle_"


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


func UpdateAnimation():
	animated_sprite_2d.play(state_machine.currentState.name + "_" + GetDirectionName())
