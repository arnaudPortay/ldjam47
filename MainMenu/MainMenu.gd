extends Control


################################################################################
func _ready():
	MusicController.loop_between(0.0,MusicController.t_end_intro)
	MusicController.playMusic(MusicController.m_main_music)
	$VBoxContainer/StartButton.grab_focus()

################################################################################

func _on_StartButton_pressed():
# warning-ignore:return_value_discarded
	MusicController.loop_between(MusicController.t_start_beat)
	get_tree().change_scene("res://MainScene/MainScene.tscn")

################################################################################

func _on_QuitButton_pressed():
	get_tree().quit()
