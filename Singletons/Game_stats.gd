extends Node

var last_succeded_level = -1
export var c_epsilon = 0.001
export var can_move: bool = true
export var can_swim: bool = false
export var can_climb: bool = false
export var can_glide: bool = false
export var can_double_jump: bool = false

export var underwater:=false;

var lActualLevel: String = "None"

var levels = {
	0: "Mountain",
	1: "Desert",
	2: "Pit"
}
var completion:= {
	"Mountain":[false,false],
	"Desert":[false,false],
	"Pit":[false]
}

func update_completion(levelIndex, doorIndex):
	completion[levels[levelIndex]][doorIndex] = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _water_entered(_body):
	underwater = true
	
func _water_exited(_body):
	underwater = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
