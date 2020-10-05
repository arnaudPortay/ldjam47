extends Node

var last_succeded_level = -1
export var c_epsilon = 0.001
export var can_move: bool = true
export var can_swim: bool = false
export var can_climb: bool = true
export var can_glide: bool = false
export var can_double_jump: bool = false
var won_the_game := false
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
	if levelIndex == 0 and doorIndex == 1:
		won_the_game = true

func get_completion(levelIndex, doorIndex)-> bool:
	return completion[levels[levelIndex]][doorIndex]

enum Item_Types {
	empty,
	climbing_boots,
	fins,
	glider,
	fromage
}

class Item:	
	var category
	var value
	
	func _init(p_category, p_value):
		self.category = p_category
		self.value = p_value
		
var _gathered_items = []

func gather_item(var item):
	_gathered_items.append(item)
	match item.category:
		Item_Types.climbing_boots:
			can_climb = true
		Item_Types.fins:
			can_swim = true
		Item_Types.glider:
			can_glide = true


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
