extends State

var wallSide:=0

func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			pass
		machine.event_back:
			pass
		machine.event_jump:
			if GameStats.can_climb:
				player.animate_end_climb()
				player.animate_jump()
#				player.do_jump(-1*player.jump_factor, player.is_against_wall)
				player.do_jump(-1*player.is_against_wall,player.jump_factor)
				machine.set_state("Fly") 
		machine.event_land:
			player.animate_end_climb()
			machine.set_state("Ground")
		machine.event_dive:
			player.animate_end_climb()
			machine.set_state("Swim")
		machine.event_up:
			if GameStats.can_climb:
				if player.is_against_wall != player.AGAINST.e_nothing :
					player.animate_climb()
					wallSide = player.is_against_wall
#					player.do_climb(-1*player.climb_factor,player.direction.x)
					player.do_climb(player.direction.x, player.climb_factor)
				else:
					#saut quand en haut du mur
					player.animate_end_climb()
					player.animate_jump()
#					player.do_jump(-1.0*player.jump_factor, wallSide)
					player.do_jump(wallSide, player.jump_factor)
					machine.set_state("Fly")
		_ : return false
	return true

func update() -> bool:
#	player.rotation_degrees = -1*wallSide*player.climbing_angle
	if player.velocity.y >0:
		player.velocity.y = 0
	#friction
#	var friction_factor = 0.5
#	player.velocity += -friction_factor*player.velocity
	if player.direction.y ==0.1: # low gravity on wall (slide)
		player.animate_climb()
		player.direction.y =0.01
	return true
