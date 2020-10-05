extends Sprite

export(GameStats.Item_Types) var item_type = GameStats.Item_Types.empty
export(int) var value = 0

signal item_taken(item_type)

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in GameStats._gathered_items:
		if i.category == item_type:
			self.hide()
			self.set_physics_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	var data = GameStats.Item.new(item_type, value)
	GameStats.gather_item(data)
	self.hide()
	self.set_physics_process(false)
	emit_signal("item_taken", item_type)
