extends State

func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			if GameStats.can_swim:
				player.set_direction (1.0,player.direction.y)
		machine.event_back:
			if GameStats.can_swim:
				player.set_direction (-1.0,player.direction.y)
		machine.event_jump:
			if GameStats.can_swim:
				if !GameStats.underwater:
					player.do_jump(player.jump_factor)
					machine.set_state("Fly")
				else:
					player.do_jump(player.swim_y_factor)
		machine.event_jump_long_press:
			if GameStats.can_swim:
				if !GameStats.underwater:
					player.do_jump(player.jump_factor)
					machine.set_state("Fly")
				else:
					player.do_jump(player.swim_y_factor)
		machine.event_up:
			if GameStats.underwater and GameStats.can_swim:
				player.do_jump(player.swim_y_factor)
		machine.event_down:
			player.do_jump(-1.0*player.swim_y_factor)
		machine.event_land:
			if not GameStats.can_swim:
				machine.return_to_start()
		_ : return false
	return true

func update() -> bool:
	if player.velocity.y >0:
		player.velocity.y=0
	#friction
	var friction_factor = 0.1
	player.velocity += -friction_factor*player.velocity
	return true
