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
				#go up
				#if onsurface  switch state to fly
			}
		event_dive:
			{
				#transition state swim
			}
		event_up:
			{
				#move up if not onsurface
			}
		event_down:
			{
				#move down
			}
		_ : return false
	return true
