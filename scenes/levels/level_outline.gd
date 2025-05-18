extends Node2D
class_name level

var next_level: String
var next_path: String
var path_prefix = "res://scenes/levels"
@export var next_level_path: String

var stroke_count: int = 0

func _ready() -> void:
	get_parent().owner.strokes = 0
	#next_level = get_node("Goal").next_level
	#get_node("Goal").win.connect(_player_win)
	next_path = path_prefix + next_level_path
	get_parent().owner.get_node("Hud/Thoughts").play("Win8")

func _player_win() -> void:
	if get_node("Enemy"):
		$Enemy.queue_free()
	get_parent().owner.get_node("WinConfetti").visible = true
	get_parent().owner.get_node("WinConfetti").play()
	get_parent().owner.get_node("Sounds/WinSound").play()
	get_parent().owner.get_node("Hud/Thoughts").play("Win9")
	await get_tree().create_timer(5.25).timeout
	get_parent().owner.get_node("WinConfetti").visible = false
	var next = load(next_path).instantiate()
	get_parent().add_child(next)
	self.queue_free()
	#get_parent().get_node("MainScene").add_child(next)
