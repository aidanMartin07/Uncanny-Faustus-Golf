extends level



func _ready() -> void:
	next_level = $Goal.next_level
	$Goal.win.connect(_player_win)
	next_path = "res://scenes/levels/" + next_level + "/"+ next_level + ".tscn"
	$Enemy.lose.connect(_lose)
	get_parent().owner.get_node("Hud/Thoughts").play("Win8")


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Restart"):
		get_parent().get_parent().reload_level(0)

func _lose() -> void:
	$LoseImage.visible = true
	$LoseSound.play()
	get_parent().owner.get_node("Hud/Thoughts").play("Death13")
	await get_tree().create_timer(2.5).timeout
	get_parent().get_parent().reload_level(0)
