extends Control

var levels = [
	preload("res://scenes/levels/level_1/level_1.tscn"),
	preload("res://scenes/levels/level_2/level_2.tscn"),
	preload("res://scenes/levels/level_3/level_3.tscn"),
	preload("res://scenes/levels/level_4/level_4.tscn")
]


signal start_game

func _ready() -> void:
	get_parent().get_parent().connect_main()

func load_level(level_num: int):
	var next_level = levels[level_num].instantiate()
	get_parent().add_child(next_level)
	start_game.emit()
	self.queue_free()

func _on_start_new_button_up() -> void:
	load_level(0)


func _on_start_level_button_up() -> void:
	$Buttons/LevelSelect.visible = !$Buttons/LevelSelect.visible


func _on_quit_button_up() -> void:
	get_tree().quit()


func _on_level_1_button_up() -> void:
	load_level(0)

func _on_level_2_button_up() -> void:
	load_level(1)

func _on_level_3_button_up() -> void:
	load_level(2)

func _on_level_4_button_up() -> void:
	load_level(3)
