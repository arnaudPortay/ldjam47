extends Node
class_name State

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var player : Bill = get_parent().get_parent()
onready var machine : StateMachine = get_parent()
# Called when the node enters the scene tree for the first time.
func handleEvent(event) -> bool:
	return false # Replace with function body.

# basic update at each frame without any event 
func update() -> bool:
	return true

