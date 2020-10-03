extends Node2D


# Declare member variables here. Examples:
onready var door := $Door
onready var left_key := $LeftKey
onready var right_key := $RightKey
onready var jump_key := $JumpKey
onready var light_key := $LightKey


func _physics_process(delta):
	if not door.is_condition_met and left_key.is_action_done and right_key.is_action_done and jump_key.is_action_done and light_key.is_action_done:
		door.set_condition_met(true)
