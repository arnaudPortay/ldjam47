extends Node
class_name State

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
const event_forward = "forward"
const event_back = "backward"
const event_down = "downward"
const event_up = "upward"
const event_jump = "jump"
const event_dive = "dive"
const event_land = "land"

onready var player : PlateformerPlayer = get_parent().get_parent()
onready var machine : StateMachine = get_parent()
# Called when the node enters the scene tree for the first time.
func handleEvent(event) -> bool:
	return false # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
