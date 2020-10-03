extends Node2D

class_name PlateformerPlayer

# Declare member variables here. Examples:
export var can_move: bool = true
export var can_swim: bool = false
export var can_climb: bool = false
export var can_glide: bool = false
export var is_against_wall : int = 0

enum AGAINST {
	e_nothing = 0,
	e_wall_on_right = 1,
	e_wall_on_left = -1
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass



