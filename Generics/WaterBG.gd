extends Sprite

func _ready() -> void:
	$waterTexture.material.set_shader_param("sprite_scale",scale)
