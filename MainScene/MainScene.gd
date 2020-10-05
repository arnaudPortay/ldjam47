extends Node2D

export(Array, String) var level_names = ["Mountain"]
export (Array, String) var level_conditions = ["NOT READY"]
var animated_state = 0
var last_elapsed_animation = 0
var last_elapsed_win = 0
var elapsed = 0
const MAX_DELAY_ANIMATION = 1
const MAX_DELAY_WIN = 2;
var won_the_game = false

onready var anim_node = $CanvasLayer/Animations
onready var bill = $CanvasLayer/CursorBill
onready var last_position_node = $CanvasLayer/LastPositionNode
onready var levels = $CanvasLayer/Levels

# Called when the node enters the scene tree for the first time.
func _ready():
	if GameStats.last_succeded_level == -1:
		bill.position = anim_node.get_child(0).rect_position
		bill.do_handle_inputs = false
	else:
		bill.position = levels.get_child(GameStats.last_succeded_level).rect_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed += delta
	if not won_the_game:
		if elapsed - last_elapsed_animation > MAX_DELAY_ANIMATION:
			last_elapsed_animation = elapsed
			if animated_state < anim_node.get_child_count():
				bill.position = anim_node.get_child(animated_state).rect_position
				animated_state += 1
				if animated_state == anim_node.get_child_count():
					bill.do_handle_inputs = true
				
			if GameStats.last_succeded_level == len(level_names) - 1:
				won_the_game = true
				bill.position = last_position_node.rect_position
				last_elapsed_win = elapsed
		
	if won_the_game and elapsed - last_elapsed_win > MAX_DELAY_WIN:
		last_elapsed_win = elapsed
# warning-ignore:return_value_discarded
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
# warning-ignore:return_value_discarded
		GameStats.lActualLevel = level_conditions[level_index]
		get_tree().change_scene("res://Levels/" + level_names[level_index] + "/" + level_names[level_index] + ".tscn")
		
