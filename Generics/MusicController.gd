extends Control

onready var _player = $GlobalMusicPlayer
onready var _player_sound = $SoundPlayer

#### sounds paths
var m_main_music := "res://Sources/ Musique/Move On - 03_10_2020 22.00.wav"
var t_start_beat := 34.0
var s_unlock_door := ""
var s_victory := ""



# Calling this function will load the given track, and play it
func playMusic(track_url : String, from : float =0.0):
	stop()
	var track = load(track_url)
	_player.stream = track
	_player.play(t_start_beat)

# Calling this function will stop the music
func stop():
	_player.stop()

func playSound(track_url : String):
	stopSound()
	var track = load(track_url)
	_player_sound.stream = track
	_player_sound.play()
	
func stopSound():
	_player_sound.stop()
