extends Sprite

export(GameStats.Item_Types) var item_type = GameStats.Item_Types.empty
export(int) var value = 0
var sound_played = false

signal item_taken(item_type)

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in GameStats._gathered_items:
		if i.category == item_type:
			deactivateItem()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	var data = GameStats.Item.new(item_type, value)
	GameStats.gather_item(data)
	if not sound_played:
		sound_played = true
		MusicController.playSound("res://Sources/Sons/PorteSFX.wav")
	deactivateItem()
	emit_signal("item_taken", item_type)

func deactivateItem() :
	self.hide()
	$Area2D/CollisionShape2D.disabled = true
	self.set_physics_process(false)
