extends State

@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var player_pos_update_timer: Timer = $"../../PlayerPosUpdateTimer"

const ACCELERATE = 5

var direction : Vector2
var speed = 100


func Update():
	super.Update()
	character.UpdateAnimation()
	
	

func UpdatePhysics(delta: float):
	super.UpdatePhysics(delta)
	direction = character.global_position.direction_to(navigation_agent_2d.get_next_path_position())
	
	if navigation_agent_2d.is_target_reached() == false:
		character.velocity = character.velocity.lerp(direction * speed, ACCELERATE * delta)
		character.move_and_slide()
		

func _on_player_pos_update_timer_timeout() -> void:
	navigation_agent_2d.target_position = character.player.global_position
	

func Enter():
	super.Enter()
	player_pos_update_timer.start()
	

func Exit():
	super.Exit()
	player_pos_update_timer.stop()
	
