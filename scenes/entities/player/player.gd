extends RigidBody2D

enum player_state  {
	IDLE,
	MOVING,
	WIN,
}

var state := player_state.IDLE

var mouse_pos

var end_point
var distance
var line_color := Color.YELLOW
var power := 1.0

const MOVEMENT_THRESHOLD = 5.0


func _physics_process(delta: float) -> void:
	mouse_released()
	if !is_moving():
		state = player_state.IDLE
	
	if Input.is_action_just_pressed("Click") and state == player_state.IDLE and !is_moving():
		print("grabbed")
		get_node("Sounds/sfxGrab").play()
	
	mouse_pos = null
	if  Input.is_action_pressed("Click") and state == player_state.IDLE and !is_moving():
		mouse_pos = get_local_mouse_position()
		queue_redraw()
		
	

func _draw():
	if mouse_pos != null:
		end_point = mouse_pos
		distance = $Sprite2D.position.distance_to(end_point)
		if distance >= 250:
			var direction = (end_point - $Sprite2D.position).normalized()
			end_point = $Sprite2D.position + direction * 250
		if distance < 50:
			line_color = Color.YELLOW
			power = 2.25
		elif distance < 100: 
			line_color = Color.CORAL
			power = 2.5
		elif distance < 150:
			line_color = Color.ORANGE
			power = 3.0
		else:
			line_color = Color.RED
			power = 3.5
		draw_line($Sprite2D.position, end_point, line_color,6)
		
	
func mouse_released():
	if Input.is_action_just_released("Click") and mouse_pos != null and state == player_state.IDLE:
		state = player_state.MOVING
		var x_component = $Sprite2D.position.x - end_point.x
		var y_component = $Sprite2D.position.y - end_point.y
		apply_impulse(Vector2(x_component*power, y_component*power))
		get_node("Sounds/sfxRelease").play()

func is_moving():
	return get_linear_velocity().length() > MOVEMENT_THRESHOLD
