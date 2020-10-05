extends Area2D

func _ready() -> void:
	connect("body_entered", GameStats, "_water_entered")
	connect("body_exited", GameStats, "_water_exited")
