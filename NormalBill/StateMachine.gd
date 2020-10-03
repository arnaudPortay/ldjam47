extends Node
class_name StateMachine

var state = null
var states = {}

onready var parent = get_parent()

func _physics_process(delta):
	if state != null:
		match state:
			states.Ground:
				if parent.currentLocation() == "swim":
					set_state(states.Swim)
				if parent.currentLocation() == "fly":
					set_state(states.Fly)
				if parent.currentLocation() == "climb":
					set_state(states.Climb)
			states.Swim:
				if parent.currentLocation() == "ground":
					set_state(states.Ground)
				if parent.currentLocation() == "fly":
					set_state(states.Fly)
				if parent.currentLocation() == "climb":
					set_state(states.Climb)
			states.Fly:
				if parent.currentLocation() == "ground":
					set_state(states.Ground)
				if parent.currentLocation() == "swim":
					set_state(states.Swim)
				if parent.currentLocation() == "climb":
					set_state(states.Climb)
			states.Climb:
				if parent.currentLocation() == "ground":
					set_state(states.Ground)
				if parent.currentLocation() == "swim":
					set_state(states.Swim)
				if parent.currentLocation() == "fly":
					set_state(states.Fly)

func set_state(new_state):
	state = new_state
