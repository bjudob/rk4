extends Node3D

@onready var game_ui = $GameUI
@onready var room_ui = $RoomUI

@onready var room_trees = $Rooms/RoomTrees
@onready var room_train = $Rooms/RoomTrain
@onready var room_candles = $Rooms/RoomCandles

var roomsMap: Dictionary

# resources
var steps = 40
var gems = 20
var keys = 1
var dices = 99

# preload
const door_scene = preload("door.tscn")

func _ready() -> void:
	roomsMap[room_trees.room_name] = room_trees
	roomsMap[room_train.room_name] = room_train
	roomsMap[room_candles.room_name] = room_candles

func _process(delta: float) -> void:
	game_ui.update(steps, gems, keys, dices)

# rooms
func select_room(place: Vector2) -> void:
	room_ui.select_room(place, room_trees, room_train, room_candles)

func spawn_room(place: Vector2, room: Room) -> void:
	var room_to_spawn = roomsMap[room.room_name]
	room_to_spawn.spawn(place)

func add_steps(s: int):
	steps += s	
	
