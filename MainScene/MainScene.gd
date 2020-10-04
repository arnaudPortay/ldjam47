extends Node2D

export(Array, String) var level_names = ["Mountain"]
export(Array, Vector2) var animated_positions = [Vector2(252, 150), Vector2(252, 273), Vector2(368, 532)]
export(Vector2) var last_position
var animated_state = 0
var last_elapsed_animation = 0
var last_elapsed_win = 0
var elapsed = 0
const MAX_DELAY_ANIMATION = 1
const MAX_DELAY_WIN = 1;
var won_the_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$CursorBill.do_handle_inputs = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed += delta
	if elapsed - last_elapsed_animation > MAX_DELAY_ANIMATION and animated_state < len(animated_positions):
		last_elapsed_animation = elapsed
		$CursorBill.position = animated_positions[animated_state]
		animated_state += 1
		if animated_state == len(animated_positions):
			$CursorBill.do_handle_inputs = true
			
	if not won_the_game and GameStats.last_succeded_level == len(level_names) - 1:
		won_the_game = true
		$CursorBill.position = last_position
		last_elapsed_win = elapsed
		
	if won_the_game and elapsed - last_elapsed_win > MAX_DELAY_WIN:
		last_elapsed_win = elapsed
		get_tree().change_scene("res://EndMenu/EndMenu.tscn")
		
# DEBUG:
func _input(event):
	if event.is_action_released("go_left"):
		GameStats.last_succeded_level = len(level_names) - 1
# DEBUG END

func check_level_accessibility(level_index):
	return  level_index < GameStats.last_succeded_level or level_index - GameStats.last_succeded_level == 1
		

func _on_CursorBill_try_entering_level(level_index):
	if check_level_accessibility(level_index):
		get_tree().change_scene("res://Levels/" + level_names[level_index] + "/" + level_names[level_index] + ".tscn")
		
