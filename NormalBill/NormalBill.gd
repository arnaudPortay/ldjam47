extends KinematicBody2D

class_name Bill

# Declare member variables here. Examples:
export var can_move: bool = true
export var can_swim: bool = false
export var can_climb: bool = false
export var can_glide: bool = false

export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 3000.0

export var light_on: bool = false

var velocity: = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	#If we want to use the gravity, not used for the moment
	velocity.y += gravity * delta
	velocity.y = min (velocity.y, speed.y)
	
	var direction: =Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-0.1 if ( Input.get_action_strength("jump") and is_on_floor())
		else -0.02 if -Input.get_action_strength("fly") 
		else 0.1
		#Use maybe 0.02, -1.0 and 1.0 values when map created
	)
	
	if Input.is_action_just_pressed("light"):
		light_on = not light_on
	
	velocity = speed * direction
	
	move_and_slide(velocity)

