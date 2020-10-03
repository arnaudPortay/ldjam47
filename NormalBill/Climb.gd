extends State

func handleEvent(event:String) -> bool: 
	match event:
		event_forward:
			{
				#if againstwall == -1 switch state to fly
				#add speed
			}
		event_back:
			{
				#if againstwall == +1 switch state to fly
				#add negative speed
			}
		event_jump:
			{
				#add negative speed depending on againstwall sign
				# switch state to fly
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
				#climb up
			}
		event_down:
			{
				#climb down
			}
		_ : return false
	return true
