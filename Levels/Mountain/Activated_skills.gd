extends Node2D

func _on_Bill_did_jump() -> void:
	$JumpKey.action_done(true)


func _on_Bill_did_move_left() -> void:
	$LeftKey.action_done(true)


func _on_Bill_did_move_right() -> void:
	$RightKey.action_done(true)


func _on_Bill_did_use_light() -> void:
	$LightKey.action_done(true)
