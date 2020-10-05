extends State
export var friction_factor := 1.0
func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			player.do_move (1.0,player.direction.y)
		machine.event_back:
			player.do_move (-1.0,player.direction.y)
		machine.event_jump:
			player.emit_signal("did_jump")
			player.do_jump(player.direction.x, player.jump_factor)
			machine.set_state("Fly")
		machine.event_dive:
			machine.set_state("Swim")
		machine.event_up:
			if player.is_against_wall != player.AGAINST.e_nothing : 
				player.do_climb(player.is_against_wall, player.climb_factor)
				machine.set_state("Climb")
		machine.event_fall:
			player.do_fall(0, 0)
			machine.set_state("Fly")
		_ : return false
	return true

func update() -> bool:
	#friction
	player.velocity += -friction_factor*player.velocity
	return true
