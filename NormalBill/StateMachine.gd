extends Node
class_name StateMachine

var state = null
export var state_name := ""
const event_forward = "forward"
const event_back = "backward"
const event_down = "downward"
const event_up = "upward"
const event_jump = "jump"
const event_jump_long_press = "jump_long"
const event_glide = "glide"
const event_dive = "dive"
const event_land = "land"
const event_fall = "fall"
const event_jump_interrupted = "jump_interrupted"
var detect_jump : bool = true
var start_position

onready var player :NormalBill= get_parent()

func _ready() -> void:
	start_position = player.position
	if player.is_on_floor():
		set_state("Ground")
	else:
		set_state("Fly")


func set_state(new_state) -> void:
	for child in get_children():
		if child.get_name() == new_state:
			#print("state change from "+state_name)
			state = child
			state_name = new_state
			#print("to "+state_name)
			break
	
# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	#wall detection
	detect_wall()
	## floor detection
	if player.is_on_floor():
		state.handleEvent(event_land)
	else:
		state.handleEvent(event_fall)
	
	#water detection
	if GameStats.underwater:
		state.handleEvent(event_dive)
	
	player.direction.y = 0.1 #gravity
#	player.rotation_degrees = player.default_angle
	## call base state update
	state.update()
	## inputs
	var gauche_droite: = Input.get_action_strength("go_right") - Input.get_action_strength("go_left")
	if gauche_droite > 0 :
		state.handleEvent(event_forward)
	elif gauche_droite < 0 :
		state.handleEvent(event_back)
	else:
		player.do_move(0.0, player.direction.y)
	var haut_bas: = Input.get_action_strength("go_down") - Input.get_action_strength("go_up")
	if haut_bas >0:
		state.handleEvent(event_down)
	elif haut_bas<0:
		state.handleEvent(event_up)
	#var jump = Input.get_action_strength("jump") == 1 
	var fly = Input.get_action_strength("glide") ==1

	if Input.is_action_just_pressed("jump"):
		state.handleEvent(event_jump)
	elif Input.get_action_strength("jump") == 1:
		state.handleEvent(event_jump_long_press)
	
	if Input.is_action_just_released("jump"):
		state.handleEvent(event_jump_interrupted)
	
	if fly :
		state.handleEvent(event_glide)
	else : 
		player.glide(false)
	# indépendant de l'état, allumer / eteindre la lumière
	if Input.is_action_just_pressed("light"):
		player.switchLight()


	## apply and bound velocity
	player.velocity += player.speed * player.direction
	player.velocity.x = max(-1*player.speed.x,min (player.velocity.x, player.speed.x))
	player.velocity.y = max(-1*player.speed.y,min (player.velocity.y, player.speed.y))
	player.apply_velocity()

func detect_wall():
	if player.is_against_wall!= 0 or player.is_on_wall():
		var space_state = player.get_world_2d().direct_space_state
		var target_right:= player.global_position+Vector2(player.distance_detection,0)
		var target_left:= player.global_position+Vector2(-1.0*player.distance_detection,0)
		var result = space_state.intersect_ray(player.global_position,target_right ,[player],player.collision_mask)
		if result.size() != 0:
			player.is_against_wall = player.AGAINST.e_wall_on_right
			#print("detected wall on right")
			## in case needed, display collision position
#			var icon: Node2D = get_tree().get_root().find_node("pointer",true,false)
#			icon.position = result.position
		else:
			var result_left = space_state.intersect_ray(player.global_position,target_left ,[player],player.collision_mask)
			if result_left.size() != 0:
				#print("detected wall on left")
				player.is_against_wall = player.AGAINST.e_wall_on_left
			else:
				player.is_against_wall =0
	else:
		player.is_against_wall =0

func return_to_start():
	player.position = start_position
	if player.is_on_floor():
		set_state("Ground")
	else:
		set_state("Fly")
	
