extends Node2D
class_name Control_Display


export(bool) var showUp = false
export(bool) var showLeft = false
export(bool) var showRight = false
export(bool) var showExplore = false

func _ready() -> void:
		$Up.visible = showUp or GameStats.can_climb
		$Down.visible = true
		$Light.visible = GameStats.can_light
		$Jump.visible = GameStats.can_move
		$Glide.visible = GameStats.can_glide
		$Explore.visible = showExplore
		$Left.visible = showLeft or GameStats.can_move
		$Right.visible = showRight or GameStats.can_move
		
func _input(event):
	if event.is_action_released("ui_cancel"):
		visible = !visible
