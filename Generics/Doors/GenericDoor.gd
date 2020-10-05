extends Node2D

# Exported variables
export(bool) var is_condition_met : bool = false
export(int) var level_index : int = 0
export var doorIndex : int
export(StreamTexture) var closed_texture : StreamTexture setget set_closed_texture
export(StreamTexture) var opened_texture : StreamTexture setget set_opened_texture

# Ready variables
onready var sprite : Sprite = $DoorArea2D/DoorSprite

# Classic variables
var is_player_in : bool = false

################################################################################

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_condition_met:
		sprite.set_texture(opened_texture)
	else:
		sprite.set_texture(closed_texture)

################################################################################

# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
	is_player_in = true
	check_end()


################################################################################

# warning-ignore:unused_argument
func _on_Area2D_body_exited(body):
	is_player_in = false

################################################################################

func condition_met(value):
	is_condition_met = value
	
	if is_condition_met:
		check_end()
		 # player out then change texture if sprite
		if sprite:
			sprite.set_texture(opened_texture)
			
	elif sprite:
		sprite.set_texture(closed_texture)

func check_end():
	if is_condition_met and is_player_in:
		GameStats.last_succeded_level = level_index
		GameStats.update_completion(level_index,doorIndex)
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://MainScene/MainScene.tscn")
################################################################################

func set_closed_texture(texture : StreamTexture):
	closed_texture = texture
	if not is_condition_met and sprite:
		sprite.set_texture(closed_texture)

################################################################################

func set_opened_texture(texture : StreamTexture):
	opened_texture = texture
	if is_condition_met and sprite:
		sprite.set_texture(opened_texture)

