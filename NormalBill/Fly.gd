extends State

func handleEvent(event:String) -> bool: 
	match event:
		event_forward:
			if player.is_against_wall() ==player.AGAINST.e_wall_on_right : 
				machine.set_state("Climb")
				#add speed
		event_back:
			if player.is_against_wall() ==player.AGAINST.e_wall_on_left : 
				machine.set_state("Climb")
			#add speed
		event_jump:
			{
				#double jump if able
			}
		event_land:
				machine.set_state("Ground")
		event_dive:
				machine.set_state("Swim")
		event_up:
			if player.is_against_wall() ==player.AGAINST.e_wall_on_right : 
				machine.set_state("Climb")
		_ : return false
	return true
