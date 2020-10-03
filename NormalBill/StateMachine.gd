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
	
	if player.is_on_floor():
		state.handleEvent(event_land)
	#If we want to use the gravity, not used for the moment
	player.velocity.y += player.gravity * delta
	player.velocity.y = min (player.velocity.y, player.speed.y)
	player.direction.y = 0.1 #gravity
	var gauche_droite: = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	if gauche_droite > 0 :
		state.handleEvent(event_forward)
	elif gauche_droite < 0 :
		state.handleEvent(event_back)
	else:
		player.direction.x = 0.0
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
	
	player.velocity = player.speed * player.direction
	player.apply_velocity()
