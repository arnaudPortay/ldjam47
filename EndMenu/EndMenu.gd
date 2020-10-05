extends Control

var audio_played = false

func _ready():
	$QuitButton.grab_focus()
	if not audio_played:
		audio_played = true
		MusicController.playMusic("res://Sources/Sons/Victory.wav")

func _on_QuitButton_pressed():
	get_tree().quit()
