extends State

@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"

var direction : Vector2

func Update():
	super.Update()
	character.UpdateAnimation()
	navigation_agent_2d.target_position = character.player.global_position
	

func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	direction = character.player.global_position.direction_to(navigation_agent_2d.get_next_path_position())
