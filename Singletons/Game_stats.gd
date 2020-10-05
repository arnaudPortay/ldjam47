extends Node

var last_succeded_level = -1
export var can_move: bool = true
export var can_swim: bool = false
export var can_climb: bool = false
export var can_glide: bool = false
export var can_double_jump: bool = false
var lActualLevel: String = "None"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
