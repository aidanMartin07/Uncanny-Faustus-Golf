extends Node

var next_level
var next_path : String

func _ready() -> void:
	next_level = $Goal.next_level
	$Goal.win.connect(_player_win)
	next_path = "res://scenes/levels/" + next_level + "/"+ next_level + ".tscn"

func _player_win() -> void:
	get_parent().owner.get_node("WinConfetti").visible = true
	get_parent().owner.get_node("WinConfetti").play()
	get_parent().owner.get_node("Sounds/WinSound").play()
	await get_tree().create_timer(5.25).timeout
	get_parent().owner.get_node("WinConfetti").visible = false
	var next = load(next_path).instantiate()
	get_parent().add_child(next)
	self.queue_free()
	#get_parent().get_node("MainScene").add_child(next)
