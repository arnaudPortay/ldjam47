extends Node2D


# Declare member variables here. Examples:
onready var door := $Door
onready var left_key := $Activated_skills/LeftKey
onready var right_key := $Activated_skills/RightKey
onready var jump_key := $Activated_skills/JumpKey
onready var light_key := $Activated_skills/LightKey


# warning-ignore:unused_argument
func _physics_process(delta):
	if not door.is_condition_met and left_key.is_action_done and right_key.is_action_done and jump_key.is_action_done and light_key.is_action_done:
		door.set_condition_met(true)
