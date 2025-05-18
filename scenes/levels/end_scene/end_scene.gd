extends Node2D

var playing: bool = false

func _ready() -> void:
	get_parent().owner.get_node("Hud/Thoughts").play("Death13")
	var fires = get_node("Fire").get_children()
	for fire in fires:
		fire.play("fire_3")

func _physics_process(delta: float) -> void:
	pass

func _play_random_sound() -> void:
	var sounds = get_node("PainSounds").get_children()
	sounds.pick_random().play()


func _on_timer_timeout() -> void:
	_play_random_sound()
