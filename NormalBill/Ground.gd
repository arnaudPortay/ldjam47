extends State

func handleEvent(event:String) -> bool: 
	match event:
		event_forward:
			{
				#add speed
			}
		event_back:
			{
				#add negative speed
			}
		event_jump:
				#jump
				machine.set_state("Fly")
		event_dive:
				machine.set_state("Swim")
		event_up:
			if player.is_against_wall() != player.AGAINST.e_nothing : 
				machine.set_state("Climb")
			
		_ : return false
	return true
