extends Control

var main_menu = preload("res://scenes/main_menu/main_menu.tscn")
var levels = [
	preload("res://scenes/levels/level_1/level_1.tscn"),
	preload("res://scenes/levels/level_2/level_2.tscn"),
	preload("res://scenes/levels/level_3/level_3.tscn")
]

var animations = [
	"Death13", "Win8", "Win9", "boom", "static"
]
var in_game: bool = false

func _ready() -> void:
	connect_main()
	$Hud/Thoughts.play("static")

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Pause") and in_game:
		pause_game()

func pause_game() -> void:
	get_tree().set_deferred("paused", true)
	$PauseMenu.visible =true

func _on_resume_button_up() -> void:
	get_tree().set_deferred("paused", false)
	$PauseMenu.visible = false

func _on_quit_to_menu_button_up() -> void:
	get_tree().paused = false
	$PauseMenu.visible = false
	var children = $MainScene.get_children()
	for child in children:
		child.queue_free()
	get_node("MainScene").add_child(main_menu.instantiate())
	in_game = false

func reload_level(index: int) -> void:
	for child in $MainScene.get_children():
		child.queue_free()
	get_node("MainScene").add_child(levels[index].instantiate())

func start_game():
	in_game = true

func connect_main() -> void:
	$MainScene/MainMenu.start_game.connect(start_game)
