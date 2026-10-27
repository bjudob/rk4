extends Node3D

@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var area = $Area3D

func _ready() -> void:
	game.connect_door(area)
