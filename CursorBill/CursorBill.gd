extends Node2D

var cursor_bill = null 
export(Array, Vector2) var positions = []
var current_index: int = 0
var do_handle_inputs = false

signal try_entering_level(level_index)

# Called when the node enters the scene tree for the first time.
func _ready():
	cursor_bill = get_tree().get_root().find_node("CursorBill", true, false)

func _input(event):
	if not do_handle_inputs:
		return
		
	if event.is_action_released("go_down") and len(positions) > 0:
		current_index = current_index + 1 if current_index < len(positions) - 1  else 0
		cursor_bill.position = positions[current_index]
		
	if event.is_action_released("ui_accept"):
		emit_signal("try_entering_level", current_index)

