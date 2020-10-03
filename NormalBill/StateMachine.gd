extends Node
class_name StateMachine

var state = null


onready var parent = get_parent()

func _ready() -> void:
	set_state("Ground")


func set_state(new_state) -> void:
	for child in get_children():
		if child.get_name() == new_state:
			state = new_state
			break
	
