extends State

func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			player.set_direction(1.0,player.direction.y)
			if player.is_against_wall ==player.AGAINST.e_wall_on_right : 
				transition_to_state("Climb")
		machine.event_back:
			player.set_direction (-1.0,player.direction.y)
			if player.is_against_wall ==player.AGAINST.e_wall_on_left : 
				transition_to_state("Climb")
		machine.event_jump:
			if GameStats.can_double_jump and player.double_jump_activable:
				player.double_jump_activable = false
				player.animate_jump()
				player.do_jump(player.direction.x, 3*player.jump_factor)
		machine.event_land:
			transition_to_state("Ground")
		machine.event_dive:
			transition_to_state("Swim")
		machine.event_up:
			if player.is_against_wall !=player.AGAINST.e_nothing : 
				transition_to_state("Climb")
		machine.event_glide:
			if GameStats.can_glide :
				player.is_gliding =true
		machine.event_jump_interrupted:
			pass
			#player.do_jump(2)
			#player.do_move(player.direction.x,0)
		_ : return false
	return true
	
func transition_to_state(target) -> bool:
	player.double_jump_activable = true
	player.is_gliding= false
	machine.set_state(target)
	return true


func update() -> bool:
	if player.velocity.y >0:
		if player.is_gliding:
			player.velocity.y=0
		else:
			player.animate_fall()

	return true
