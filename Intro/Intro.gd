extends CanvasLayer

func _on_VideoPlayer_finished():
	MusicController.loop_between(MusicController.t_start_beat)
	MusicController.playMusic(MusicController.m_main_music)
	get_tree().change_scene("res://MainScene/MainScene.tscn")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_skip"):
		MusicController.loop_between(MusicController.t_start_beat)
		MusicController.playMusic(MusicController.m_main_music)
		get_tree().change_scene("res://MainScene/MainScene.tscn")
