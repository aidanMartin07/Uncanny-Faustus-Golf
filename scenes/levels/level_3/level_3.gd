extends level

var level_4_path = preload("res://scenes/levels/level_4/level_4.tscn")

func _ready() -> void:
	$Hay.visible = false
	next_level = $Goal.next_level
	$Goal.win.connect(_player_win)
	next_path = "res://scenes/levels/" + next_level + "/"+ next_level + ".tscn"
	$Enemy.lose.connect(_lose)
	get_parent().get_parent().get_node("Hud/Thoughts").play("Win8")


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Restart"):
		get_parent().get_parent().reload_level(2)
		$Horse.stop()
		$LoseSound.stop()

func _lose() -> void:
	$LoseImage.visible = true
	$LoseSound.play()
	get_parent().owner.get_node("Hud/Thoughts").play("Death13")
	await get_tree().create_timer(2.5).timeout
	get_parent().get_parent().reload_level(2)

func _player_win() -> void:
	if get_node("Enemy"):
		$Enemy.queue_free()
	$Hay.visible = true
	$Horse.play()
	$Hay.position = $RigidBody2D/Sprite2D.global_position
	$RigidBody2D.visible = false
	get_parent().owner.get_node("Hud/Thoughts").play("Win9")
	await get_tree().create_timer(3.5).timeout
	var next = level_4_path.instantiate()
	get_parent().add_child(next)
	self.queue_free()
