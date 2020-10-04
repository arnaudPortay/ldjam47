extends Node2D

export(String) var binding_action_string
export(bool) var extra_condition = true
export(StreamTexture) var key_texture : StreamTexture
export(Color) var modulate_when_deactivated = Color(0.5, 0.5, 0.5)
export(Color) var modulate_when_activated = Color(1.0, 1.0, 1.0)
export var is_action_done : bool = false

onready var sprite := $KeySprite
onready var label_title := $KeyLabeltitle
onready var label_action := $KeyLabelaction

################################################################################

func _ready():
	if sprite:
		sprite.set_texture(key_texture)
		
		var action :String= binding_action_string
		var array = action.split("_")
		if array.size() >1:
			action = array[1]
		label_action.text = action + " :"
		label_title.text = InputMap.get_action_list(binding_action_string)[0].as_text()
		sprite.self_modulate = modulate_when_deactivated

################################################################################

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_just_released(binding_action_string) and not is_action_done:
		is_action_done = true
		sprite.self_modulate = modulate_when_activated

################################################################################

