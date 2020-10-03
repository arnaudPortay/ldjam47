extends State

func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			player.set_direction (1.0,player.direction.y)
		machine.event_back:
			player.set_direction (-1.0,player.direction.y)
		machine.event_jump:
				player.do_jump(player.jump_factor)
				machine.set_state("Fly")
		machine.event_dive:
				machine.set_state("Swim")
		machine.event_up:
			if player.is_against_wall() != player.AGAINST.e_nothing : 
				machine.set_state("Climb")
			
		_ : return false
	return true

