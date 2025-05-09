extends RigidBody2D

@export var state: Node

signal spawned 
signal hit_up

signal tv_p

const MAX_DRAG = 185
const DRAG_MULTIPLIER = 5
const DRAG_CANCEL = 20
const FRIC_COEFF = 0.04
const FRIC_POW = 1.06
const STOP_SPEED = 20

const HUE_WEAKEST = 0.69
const HUE_STRONGEST = 0

func transition_to(target_state_name: String, type: int =0):
	assert(has_node("States/" + target_state_name))
	state.exit()
	state = get_node("States/" + target_state_name)
	state.enter(type)
	state.update()
