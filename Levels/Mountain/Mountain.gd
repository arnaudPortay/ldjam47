extends Node2D

export var ok_right:= false
export var ok_left:= false
export var ok_jump:= false
export var ok_light:= false


func check_end():
	if ok_right and ok_left and ok_jump: #and ok_light:
		GameStats.can_move = true
		get_tree().call_group("Doors", "condition_met", true)


func _on_Player_did_jump() -> void:
	ok_jump = true
	check_end()


func _on_Player_did_move_left() -> void:
	ok_left = true
	check_end()


func _on_Player_did_move_right() -> void:
	ok_right = true
	check_end()


func _on_Player_did_use_light() -> void:
	ok_light = true
	check_end()
