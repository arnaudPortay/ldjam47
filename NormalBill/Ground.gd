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
			{
				#transition state air
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
