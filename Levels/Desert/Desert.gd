extends Node2D

var sound_played = false

func check_end():
	if not sound_played:
		sound_played = true
		MusicController.playSound("res://Sources/Sons/One More.wav")
	get_tree().call_group("Doors", "condition_met", true)


func _on_Eau_body_entered(body):
	check_end()
