extends Node3D

@onready var player = get_tree().get_nodes_in_group("player")[0]
var player_starting_pos

@onready var game_ui = $GameUI
@onready var room_ui = $RoomUI
@onready var new_day_ui = $NewDayUI

@onready var room_trees = $Rooms/RoomTrees
@onready var room_train = $Rooms/RoomTrain
@onready var room_candles = $Rooms/RoomCandles
@onready var room_rest = $Rooms/RoomRest
@onready var room_red_button = $Rooms/RoomRedButton
@onready var room_parlor = $Rooms/RoomParlor
@onready var room_workshop = $Rooms/RoomWorkshop
@onready var room_prison = $Rooms/RoomPrison

const save_file_path = "user://rk.json"
var save_data = {
	days: 1,
}

# rooms
var rng
var rooms = []
var roomsUsed = []

# resources
var days = 1
var steps_default = 5
var steps = 5
var gems = 20
var keys = 1
var dices = 99

# preload
const door_scene = preload("door.tscn")

func _ready() -> void:
	player_starting_pos = player.position
	rng = RandomNumberGenerator.new()
	rooms = [
		room_trees,
		room_train,
		room_candles,
		room_rest,
		room_red_button,
		room_parlor,
		room_workshop,
		room_prison
	]

func _process(delta: float) -> void:
	game_ui.update(days, steps, gems, keys, dices)

func add_steps(s: int):
	steps += s	
	if steps <= 0:
		new_day_ui.new_day(days)
	
func new_day():
	steps = steps_default
	days = days + 1
	player.position = player_starting_pos
	roomsUsed = []
	for room in rooms:
		room.reset()
	var doors = get_tree().get_nodes_in_group("door")
	for door in doors:
		door.reset()

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
	
func get_room(n: int, rUsed: Array):
	var m = 0
	for i in len(rooms):
		if i in rUsed:
			continue
		if m==n:
			return i
		m = m + 1
		
func save():
	var save_file = FileAccess.open(save_file_path, FileAccess.WRITE)
	save_data.days = days
	save_file.store_var(save_data.duplicate())
	save_file.close()
	
func load():
	if !FileAccess.file_exists(save_file_path):
		return
	var save_file = FileAccess.open(save_file_path, FileAccess.READ)
	var data = save_file.get_var()
	save_file.close()
	
	var save_d = data.duplicate()
	save_data.days = save_d.days
	
	
	
	
