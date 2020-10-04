extends Node2D

export(String) var binding_action_string
export(bool) var extra_condition = true
export(StreamTexture) var key_texture : StreamTexture
export(Color) var modulate_when_deactivated = Color(0.5, 0.5, 0.5)
export(Color) var modulate_when_activated = Color(1.0, 1.0, 1.0)
export var is_action_done : bool = false setget action_done
export var display_action : bool = true
onready var sprite := $KeySprite
onready var label_title := $KeyLabeltitle
onready var label_action := $KeyLabelaction

################################################################################

func action_done(done) :
	is_action_done = done
	if sprite :
		if done:
			sprite.self_modulate = modulate_when_activated
		else:
			sprite.self_modulate = modulate_when_deactivated

func _ready():
	if sprite:
		sprite.set_texture(key_texture)
		if binding_action_string !="":
			if display_action:
				var action :String= binding_action_string
				var array = action.split("_")
				if array.size() >1:
					action = array[1]
				action= action.capitalize();
				label_action.text = action + " :"
			label_title.text = InputMap.get_action_list(binding_action_string)[0].as_text()
		else:
			label_action.text = ""
		if is_action_done:
			sprite.self_modulate = modulate_when_activated
		else:
			sprite.self_modulate = modulate_when_deactivated
	
################################################################################


################################################################################

