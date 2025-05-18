extends level

var end_level = preload("res://scenes/levels/end_scene/end_scene.tscn")

func _ready() -> void:

	$Enemy.lose.connect(_lose)
	get_parent().owner.get_node("Hud/Thoughts").play("Win8")


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Restart"):
		get_parent().get_parent().reload_level(2)

func _lose() -> void:

	var next = end_level.instantiate()
	get_parent().add_child(next)
	self.queue_free()

#func _player_win() -> void:
	#if get_node("Enemy"):
		#$Enemy.queue_free()
	#get_parent().owner.get_node("WinConfetti").visible = true
	#get_parent().owner.get_node("WinConfetti").play()
	#get_parent().owner.get_node("Sounds/WinSound").play()
	#get_parent().owner.get_node("Hud/Thoughts").play("Win9")
	#await get_tree().create_timer(5.25).timeout
	#get_parent().owner.get_node("WinConfetti").visible = false
	#var next = load(next_path).instantiate()
	#get_parent().add_child(next)
	#self.queue_free()
