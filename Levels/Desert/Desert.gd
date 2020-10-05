extends Node2D

func check_end():
	get_tree().call_group("Doors", "condition_met", true)


func _on_Eau_body_entered(body):
	check_end()
