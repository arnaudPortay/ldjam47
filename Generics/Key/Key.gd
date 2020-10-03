extends Node2D

export(String) var binding_action_string
export(StreamTexture) var key_unpressed_texture : StreamTexture setget set_unpressed_texture
export(StreamTexture) var key_pressed_texture : StreamTexture
export var is_action_done : bool = false

onready var sprite := $KeySprite

################################################################################

func _ready():
	if sprite:
		sprite.set_texture(key_unpressed_texture)

################################################################################

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_just_released(binding_action_string) and not is_action_done:
		is_action_done = true
		sprite.set_texture(key_pressed_texture)

################################################################################

func set_unpressed_texture(texture):
	key_unpressed_texture = texture
	if sprite:
		sprite.set_texture(key_unpressed_texture)

################################################################################
