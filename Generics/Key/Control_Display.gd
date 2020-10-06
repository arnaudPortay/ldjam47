extends Node2D
class_name Control_Display

signal need_restart

export(bool) var showBaseControls = false
export(bool) var showMainSceneControls = false
export var can_be_canceled := true
export var show_restart := true
onready var restartButton :Node = $Buttons/Restart

func _ready() -> void:
	if restartButton:
		restartButton.visible = show_restart
	refresh()
		
func _input(event):
	if (event.is_action_released("ui_cancel") or event.is_action_released("help")) and can_be_canceled:
		visible = !visible

func refresh():
		$Up.visible = GameStats.can_climb
		$Down.visible = showMainSceneControls
		$Light.visible = GameStats.can_light
		$Jump.visible = showBaseControls or GameStats.can_move
		$Glide.visible = GameStats.can_glide
		$Explore.visible = showMainSceneControls
		$Left.visible = showBaseControls or GameStats.can_move
		$Right.visible = showBaseControls or GameStats.can_move

func _on_Button_pressed() -> void:
	emit_signal("need_restart")


func _on_Item_taken(item_type) -> void:
	refresh()


func _on_Exit_pressed() -> void:
	get_tree().quit()
