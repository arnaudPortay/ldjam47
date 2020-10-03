extends Node
class_name StateMachine

var state = null
export var state_name := ""
const event_forward = "forward"
const event_back = "backward"
const event_down = "downward"
const event_up = "upward"
const event_jump = "jump"
const event_glide = "glide"
const event_dive = "dive"
const event_land = "land"

onready var player = get_parent()

func _ready() -> void:
	if player.is_on_floor():
		set_state("Ground")
	else:
		set_state("Fly")


func set_state(new_state) -> void:
	for child in get_children():
		if child.get_name() == new_state:
			state = child
			state_name = new_state
			break
	
func _physics_process(delta: float) -> void:
	if player.is_on_wall():
		if player.is_against_wall == 0 :
			if player.velocity.x>0:
				player.is_against_wall = -1
			else:
				player.is_against_wall =1
	elif state.get_name() != "Climb":
		player.is_against_wall =0
	if player.is_on_floor():
		state.handleEvent(event_land)
	player.direction.y = 0.1 #gravity
	var gauche_droite: = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	if gauche_droite > 0 :
		state.handleEvent(event_forward)
	elif gauche_droite < 0 :
		state.handleEvent(event_back)
	else:
		player.direction.x = 0.0
	var haut_bas: = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if haut_bas >0:
		state.handleEvent(event_down)
	elif haut_bas<0:
		state.handleEvent(event_up)
	var jump = Input.get_action_strength("jump") == 1 
	var fly = Input.get_action_strength("fly") ==1
	if jump :
		state.handleEvent(event_jump)
	elif fly :
		state.handleEvent(event_glide)

	state.update()
	 # indépendant de l'état, allumer / eteindre la lumière
	if Input.is_action_just_pressed("light"):
		player.switchLight()
		
	player.velocity += player.speed * player.direction
	player.velocity.x = max(-1*player.speed.x,min (player.velocity.x, player.speed.x))
	player.velocity.y = max(-1*player.speed.y,min (player.velocity.y, player.speed.y))
	player.apply_velocity()
