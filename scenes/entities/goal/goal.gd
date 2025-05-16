extends Node2D

@export var next_level : String
var next_path: String

signal win

func _ready() -> void:
	next_path = "res://scenes/levels/" + next_level + "/"+ next_level + ".tscn"
	$Flag.play()

func change_level(level: String):
	var main = owner.get_node("MainScene")
	var next = load(next_path).instantiate()
	main.get_child(0).queue_free()
	main.add_child(next)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		win.emit()
