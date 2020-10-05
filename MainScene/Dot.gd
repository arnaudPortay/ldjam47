extends Sprite

export(bool) var extra_condition = true
export(Color) var modulate_when_deactivated = Color(0.5, 0.5, 0.5)
export(Color) var modulate_when_activated = Color(1.0, 1.0, 1.0)
export var is_action_done : bool = false setget action_done

################################################################################

func action_done(done) :
	is_action_done = done
	if done:
		self_modulate = modulate_when_activated
	else:
		self_modulate = modulate_when_deactivated

func _ready():
		if is_action_done:
			self_modulate = modulate_when_activated
		else:
			self_modulate = modulate_when_deactivated
	
################################################################################


################################################################################

