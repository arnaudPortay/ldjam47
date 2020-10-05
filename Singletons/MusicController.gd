extends Control

onready var _player = $GlobalMusicPlayer
onready var _player_sound = $SoundPlayer
#### sounds paths
var m_main_music := "res://Sources/ Musique/Move On - 03_10_2020 22.00.wav"
var t_end_intro := 33.3
var t_start_beat := 34.0
var s_unlock_door := ""
var s_victory := ""
var t_current_loop : Vector2 = Vector2(0.0,0.0)

func _physics_process(_delta: float) -> void:
	var pos= _player.get_playback_position()
	if t_current_loop.y != 0 and pos >= t_current_loop.y:
		_player.seek(t_current_loop.x)

# Calling this function will load the given track, and play it
func playMusic(track_url : String, from : float =0.0):
	stop()
	var track = load(track_url)
	_player.stream = track
	_player.play(from)

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

func loop_between(x,y=0.0):
	t_current_loop = Vector2(x,y)


func _on_GlobalMusicPlayer_finished() -> void:
	_player.play(t_current_loop.x)
