extends Node3D

@export var place = Vector2(-1, -1)

@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var area = $Area3D

var roomSelected = false

func _ready() -> void:
	area.body_entered.connect(_on_door_body_entered)

func _on_door_body_entered(body: Node3D) -> void:
	if not roomSelected:
		game.select_room(place)
		roomSelected = true
	game.add_steps(-1)
