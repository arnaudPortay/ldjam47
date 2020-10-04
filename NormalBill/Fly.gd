extends State

func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			player.set_direction (1.0,player.direction.y)
			if player.is_against_wall ==player.AGAINST.e_wall_on_right : 
				player.double_jump_activable = true
				machine.set_state("Climb")
		machine.event_back:
			player.set_direction (-1.0,player.direction.y)
			if player.is_against_wall ==player.AGAINST.e_wall_on_left : 
				player.double_jump_activable = true
				machine.set_state("Climb")
		machine.event_jump:
			if GameStats.can_double_jump and player.double_jump_activable:
				player.double_jump_activable = false
				player.do_jump(3*player.jump_factor)
		machine.event_land:
			player.double_jump_activable = true
			machine.set_state("Ground")
		machine.event_dive:
			player.double_jump_activable = true
			machine.set_state("Swim")
		machine.event_up:
			if player.is_against_wall !=player.AGAINST.e_nothing : 
				player.double_jump_activable = true
				machine.set_state("Climb")
		machine.event_jump_interrupted:
			player.do_jump(2)
		_ : return false
	return true
