extends Node3D

@onready var room_ui = $RoomUI

@onready var room_trees = $RoomTrees
@onready var room_train = $RoomTrain
@onready var room_candles = $RoomCandles

var roomsMap: Dictionary
var roomSelected = false


func _ready() -> void:
	roomsMap[room_trees.room_name] = room_trees
	roomsMap[room_train.room_name] = room_train
	roomsMap[room_candles.room_name] = room_candles

func _process(delta: float) -> void:
	pass

func select_room(place: Vector2) -> void:
	room_ui.select_room(room_trees, room_train, room_candles)

func spawn_room(room: Room) -> void:
	var room_to_spawn = roomsMap[room.room_name]
	room_to_spawn.spawn(Vector2(0,2))
	
	

func _on_area_3d_body_entered(body: Node3D) -> void:
	if not roomSelected:
		room_ui.select_room(room_trees, room_train, room_candles)
		roomSelected = true
