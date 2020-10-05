extends Node2D
class_name Control_Display

func _ready() -> void:
		$Up.visible = GameStats.can_climb
		$Down.visible = true
		$Light.visible = GameStats.can_light
		$Jump.visible = GameStats.can_move
		$Glide.visible = GameStats.can_glide
		$Explore.visible = true
		$Left.visible = GameStats.can_move
		$Right.visible = GameStats.can_move
