extends Node2D

var cursor_bill = null 
export(Array, int) var y_positions = [10]
var current_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	cursor_bill = get_tree().get_root().find_node("CursorBill", true, false)

func _input(event):
	if event.is_action_released("go_down") and len(y_positions) > 0:
		current_index = current_index + 1 if current_index < len(y_positions) - 1  else 0
		cursor_bill.position = Vector2(cursor_bill.position.x, y_positions[current_index])

