extends State

var wallSide:=0

func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			pass
		machine.event_back:
			pass
		machine.event_jump:
			if GameStats.can_climb:
				player.do_jump(player.is_against_wall, player.jump_factor)
				machine.set_state("Fly") 
		machine.event_land:
			machine.set_state("Ground")
		machine.event_dive:
			machine.set_state("Swim")
		machine.event_up:
			if GameStats.can_climb:
				if player.is_against_wall != player.AGAINST.e_nothing :
					wallSide = player.is_against_wall
					player.do_climb(player.direction.x, player.climb_factor)
				else:
					player.do_jump(-1.0*wallSide, player.jump_factor)
					machine.set_state("Fly")
		machine.event_down:
			player.do_jump(player.direction.x, -1.0*player.climb_factor)
		_ : return false
	return true

func update() -> bool:
	#friction
#	var friction_factor = 0.5
#	player.velocity += -friction_factor*player.velocity
	if player.direction.y ==0.1: # low gravity on wall (slide)
		player.direction.y =0.01
	return true
