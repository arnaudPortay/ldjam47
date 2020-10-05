extends KinematicBody2D

class_name NormalBill

signal did_jump
signal did_move_right
signal did_move_left
signal did_use_light

# Declare member variables here. Examples:

export var is_on_surface: bool = false
export var is_against_wall : int = 0
export var is_gliding := false

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
export var climb_factor: = -0.05
export var jump_factor: = -0.1
export var light_on: bool = false
export var distance_detection :=90.0 ## should be equal to at least half the player width
var velocity: = Vector2.ZERO

onready var sprite : AnimatedSprite = $icon
onready var bill = self

export var climbing_angle = 90
export var default_angle = 0

func apply_velocity() -> void:
	if velocity.x > 0:
		emit_signal("did_move_right")
	elif velocity.x < 0:
		emit_signal("did_move_left")
	velocity = move_and_slide(velocity, Vector2.UP)

func switchLight()->void:
	emit_signal("did_use_light")
	light_on = not light_on
	#@TODO switch light
	
func animate_turn(flip):
	if sprite.flip_h != flip:
		sprite.position.x = -sprite.position.x
	sprite.flip_h = flip


func do_jump(x,y):
	bill.rotation_degrees = default_angle
	sprite.play("Jump")
		
	set_direction (x,y)
	
func do_fall(x,y):
	
	bill.rotation_degrees = default_angle
	sprite.play("Fall")
	set_direction (x,y)
	
func do_climb(x,y):
	bill.rotation_degrees = -x*climbing_angle
	set_direction(x,y)
	
func do_move(x, y):
	if is_on_floor():
		if x != 0: 
			sprite.play("Walk")
		else:
			sprite.play("Idle")
	bill.rotation_degrees = default_angle
	set_direction(x,y)

func set_direction(x,y)->void:
	if direction.x != x and x != 0:
		animate_turn(x<0)
	direction.x = x
	direction.y = y
