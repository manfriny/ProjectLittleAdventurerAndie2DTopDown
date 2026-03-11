extends BaseCharacter

func _unhandled_input(_event: InputEvent) -> void:
	inputDirecton = Input.get_vector("Left","Right","Up","Down")
