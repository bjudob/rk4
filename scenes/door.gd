extends Node3D

@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var area = $Area3D

var roomSelected = false

func _ready() -> void:
	area.body_entered.connect(_on_door_body_entered)

func _on_door_body_entered(body: Node3D) -> void:
	if not roomSelected:
		game.select_room(Vector2(0, 5))
		roomSelected = true
