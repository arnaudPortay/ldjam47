extends State
export var friction_factor := 1.0
func handleEvent(event:String) -> bool: 
	match event:
		machine.event_forward:
			player.set_direction (1.0,player.direction.y)
		machine.event_back:
			player.set_direction (-1.0,player.direction.y)
		machine.event_jump:
			player.emit_signal("did_jump")
			player.do_jump(player.jump_factor)
			machine.set_state("Fly")
		machine.event_dive:
			machine.set_state("Swim")
		machine.event_up:
			if player.is_against_wall != player.AGAINST.e_nothing : 
				player.do_jump(player.climb_factor)
				machine.set_state("Climb")
		machine.event_fall:
			machine.set_state("Fly")
		_ : return false
	return true

func update() -> bool:
	#friction
	player.velocity += -friction_factor*player.velocity
	return true
