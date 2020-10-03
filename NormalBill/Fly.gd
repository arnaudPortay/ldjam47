extends State

func handleEvent(event:String) -> bool: 
	match event:
		event_forward:
			{
				#if againstwall switch state to climb
				#add speed
			}
		event_back:
			{
				#if againstwall switch state to climb
				#add negative speed
			}
		event_jump:
			{
				#double jump if able
			}
		event_land:
			{
				# transition to ground
			}
		event_dive:
			{
				#transition state swim
			}
		event_up:
			{
				#if againstwall switch state to climb
			}
		_ : return false
	return true
