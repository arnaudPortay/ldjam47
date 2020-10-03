extends State

func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			player.set_direction (1.0,player.direction.y)
		machine.event_back:
			player.set_direction (-1.0,player.direction.y)
		machine.event_jump:
			if player.is_on_surface:
				player.do_jump(player.jump_factor)
				machine.set_state("Fly")
			else:
				player.do_jump(player.swim_y_factor)
		machine.event_up:
			player.do_jump(player.swim_y_factor)
		machine.event_down:
			player.do_jump(-1.0*player.swim_y_factor)
		_ : return false
	return true

func update() -> bool:
	if player.direction.y ==0.1: #no gravity under water
		player.direction.y =0
	return true
