extends Node

var last_succeded_level = -1
export var can_move: bool = true
export var can_swim: bool = false
export var can_climb: bool = false
export var can_glide: bool = false
export var can_double_jump: bool = false
var lActualLevel: String = "None"

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
	
	func _init(category, value):
		self.category = category
		self.value = value
		
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
