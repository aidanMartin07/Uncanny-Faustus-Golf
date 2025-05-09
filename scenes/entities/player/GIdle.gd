extends State

var clickpos := Vector2.ZERO
var hit_dir = null

func enter(type : int =0):
	hit_dir = owner.get_node("HitDirection")
	#owner.get_node("Sounds").get_node("sfxPickUpNotif").play() line to play sound
	hit_dir.visible = false
	if Input.is_action_pressed("Click"):
		clickpos = owner.owner.get_node("ClickMark").position
		owner.get_node("Sounds").get_node("sfxGrab").play()

func exit():
	pass

func update(): 
	if Input.is_action_just_pressed("Click"):
		clickpos = owner.owner.get_global_mouse_position()
		owner.get_node("Sounds").get_node("sfxGrab").play()
		
		if Input.is_action_pressed("Click"):
			hit_dir.visible = true
