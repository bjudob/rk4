extends Node3D

@onready var room_ui = $RoomUI

@onready var room_trees = $RoomTrees
@onready var room_train = $RoomTrain
@onready var room_candles = $RoomCandles



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func select_room(place: Vector2):
	room_ui.select_room(room_trees, room_train, room_candles)

func _on_area_3d_body_entered(body: Node3D) -> void:
	room_ui.select_room(room_trees, room_train, room_candles)
