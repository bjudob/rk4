extends Node3D

@onready var game_ui = $GameUI
@onready var room_ui = $RoomUI

@onready var room_trees = $Rooms/RoomTrees
@onready var room_train = $Rooms/RoomTrain
@onready var room_candles = $Rooms/RoomCandles
@onready var room_rest = $Rooms/RoomRest
@onready var room_red_button = $Rooms/RoomRedButton

# rooms
var rng
var rooms = []
var roomsUsed = []

# resources
var day = 1
var steps = 40
var gems = 20
var keys = 1
var dices = 99

# preload
const door_scene = preload("door.tscn")

func _ready() -> void:
	rng = RandomNumberGenerator.new()
	rooms = [
		room_trees,
		room_train,
		room_candles,
		room_rest,
		room_red_button
	]

func _process(delta: float) -> void:
	game_ui.update(steps, gems, keys, dices)

# rooms
func select_room(place: Vector2) -> void:
	var roomsUsedTmp = []
	for roomUsed in roomsUsed:
		roomsUsedTmp.append(roomUsed)
	
	var roomsNr = len(rooms) - len(roomsUsedTmp)
	var rnd1 = rng.randi_range(0, roomsNr-1)
	var i1 = get_room(rnd1, roomsUsedTmp)
	roomsUsedTmp.append(i1)
	
	roomsNr = roomsNr - 1
	var rnd2 = rng.randi_range(0, roomsNr-1)
	var i2 = get_room(rnd2, roomsUsedTmp)
	roomsUsedTmp.append(i2)
	
	roomsNr = roomsNr - 1
	var rnd3 = rng.randi_range(0, roomsNr-1)
	var i3 = get_room(rnd3, roomsUsedTmp)
	
	room_ui.select_room(place, rooms[i1], rooms[i2], rooms[i3])

func spawn_room(place: Vector2, room: Room) -> void:
	for i in len(rooms):
		if room.name == rooms[i].name:
			roomsUsed.append(i)
	room.spawn(place)

func add_steps(s: int):
	steps += s	
	
func get_room(n: int, rUsed: Array):
	var m = 0
	for i in len(rooms):
		if i in rUsed:
			continue
		if m==n:
			return i
		m = m + 1
