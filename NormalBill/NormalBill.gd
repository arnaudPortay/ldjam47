extends KinematicBody2D

class_name NormalBill

# Declare member variables here. Examples:
export var can_move: bool = true
export var can_swim: bool = false
export var can_climb: bool = false
export var can_glide: bool = false
export var can_double_jump: bool = false
export var is_on_surface: bool = false
export var is_against_wall : int = 0

var double_jump_activable = true
enum AGAINST {
	e_nothing = 0,
	e_wall_on_right = -1,
	e_wall_on_left = 1
}
export var direction: = Vector2.ZERO
export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 3000.0
export var swim_y_factor: = -0.02
export var climb_factor: = -0.02
export var jump_factor: = -0.1
export var light_on: bool = false
export var distance_detection :=11.0 ## should be equal to at least half the player width
var velocity: = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func apply_velocity() -> void:
	velocity = move_and_slide(velocity, Vector2.UP)

func switchLight()->void:
	light_on = not light_on
	#@TODO switch light
func animate_turn():
	pass
func do_jump(factor):
	set_direction (direction.x,factor)
func set_direction(x,y)->void:
	if direction.x != x and x!=0:
		animate_turn()
	direction.x = x
	direction.y = y
