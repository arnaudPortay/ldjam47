extends State

func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			{
				#do nothing for now
			}
		machine.event_back:
			{
				#do nothing for now
			}
		machine.event_jump:
			player.set_direction (player.is_against_wall,player.direction.y)
			player.do_jump(player.jump_factor)
			machine.set_state("Fly") 
		machine.event_land:
			machine.set_state("Ground")
		machine.event_dive:
			machine.set_state("Swim")
		machine.event_up:
			player.do_jump(player.climb_factor)
		machine.event_down:
			player.do_jump(-1.0*player.climb_factor)
		_ : return false
	return true

func update() -> bool:
	#friction
	var friction_factor = 0.5
	player.velocity += -friction_factor*player.velocity
	if player.direction.y ==0.1: # low gravity on wall (slide)
		player.direction.y =0.01
	return true
