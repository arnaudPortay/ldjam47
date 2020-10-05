extends Node
class_name WhileDisplay

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var WhileLabel : RichTextLabel = $WhileLabel

#WhileLabel.text = str(toto)
# Called when the node enters the scene tree for the first time.
func _ready():
	WhileLabel.set_bbcode("[color=#C586A1] While[/color] ( [color=#569CD0]" + GameStats.lActualLevel + "[/color] ) \n {")


func change_level():
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
