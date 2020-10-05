extends Node2D


var boots_taken = false
var sound_played = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ConditionMetArea_body_entered(body):
	if boots_taken:
		get_tree().call_group("Doors", "condition_met", true)


func _on_Boots_item_taken(item_type):
	if item_type == GameStats.Item_Types.climbing_boots:
		boots_taken = true
		if not sound_played:
			sound_played = true
			MusicController.playSound("res://Sources/Sons/One More.wav")
