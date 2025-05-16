extends CharacterBody2D

@export var player_node: RigidBody2D

var player_sprite: Sprite2D

const SPEED = 40

signal lose

func _ready() -> void:
	player_sprite = player_node.get_node("Sprite2D")

func _physics_process(delta: float) -> void:
	var player_position = player_node.position
	var target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 3:
		position += target_position *SPEED * delta
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
	if body.is_in_group("Player") and body.state == 2:
		return
	lose.emit()
