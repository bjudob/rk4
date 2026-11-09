extends Node3D

@onready var player = get_tree().get_nodes_in_group("player")[0]
var player_starting_pos

@onready var game_ui = $GameUI
@onready var room_ui = $RoomUI
@onready var new_day_ui = $NewDayUI
@onready var tarot_ui = $TarotUI
@onready var blueprint_ui = $BlueprintUI

@onready var room_start = $Rooms/RoomStart
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
	"days": 1,
	"room_start_lock": false,
	"tarots": []
}

# rooms
var rng
var rooms = {}
var rooms_rnd = []
var rooms_used = []
var room_total_weights = 0

# resources
var days = 1
var steps_default = 15
var steps = 15
var candies = 5
var candies_default = 5
var keys = 3
var keys_default = 3
var dices = 2
var dices_default = 2

# preload
const door_scene = preload("door.tscn")

func _ready() -> void:
	player_starting_pos = player.position
	rng = RandomNumberGenerator.new()
	rooms = {
		room_trees.room_name: room_trees,
		room_train.room_name: room_train,
		room_candles.room_name: room_candles,
		room_rest.room_name: room_rest,
		room_red_button.room_name: room_red_button,
		room_parlor.room_name: room_parlor,
		room_workshop.room_name: room_workshop,
		room_prison.room_name: room_prison,
	}
	for room_name in rooms:
		room_total_weights = room_total_weights + rooms[room_name].rarity
		for i in rooms[room_name].rarity:
			rooms_rnd.append(room_name)

func _process(delta: float) -> void:
	game_ui.update(days, steps, candies, keys, dices)
	if Input.is_action_just_pressed("menu"):
		if tarot_ui.visible:
			tarot_ui.hide_ui()
		else:
			tarot_ui.show_ui()
	elif Input.is_action_just_pressed("map"):
		if blueprint_ui.visible:
			blueprint_ui.hide_ui()
		else:
			blueprint_ui.show_ui()

func add_steps(s: int):
	steps += s	
	if steps <= 0:
		show_new_day_ui()

func show_new_day_ui():
	new_day_ui.new_day(days)

func add_keys(k: int):
	keys += k
	
func add_candies(c: int):
	candies += c
	
func add_dices(d: int):
	dices += d
	
func new_day():
	steps = steps_default
	days = days + 1
	player.position = player_starting_pos
	rooms_used = []
	for room_name in rooms:
		rooms[room_name].reset()
	var doors = get_tree().get_nodes_in_group("door")
	for door in doors:
		door.reset()
	blueprint_ui.draw_rooms(rooms.values())
	save()

# rooms
func select_room(place: Vector2, entry_direction: Room.EntryDirection) -> void:
	var rooms_used_tmp = []
	for roomUsed in rooms_used:
		rooms_used_tmp.append(roomUsed)
	
	var room_used_weight = rooms_used_total_weight()
	var roomsNr = room_total_weights - room_used_weight
	var rnd1 = rng.randi_range(0, roomsNr-1)
	var room_name_1 = random_room(rnd1, rooms_used_tmp)
	rooms_used_tmp.append(room_name_1)
	
	roomsNr = roomsNr - rooms[room_name_1].rarity
	var rnd2 = rng.randi_range(0, roomsNr-1)
	var room_name_2 = random_room(rnd2, rooms_used_tmp)
	rooms_used_tmp.append(room_name_2)
	
	roomsNr = roomsNr - rooms[room_name_2].rarity
	var rnd3 = rng.randi_range(0, roomsNr-1)
	var room_name_3 = random_room(rnd3, rooms_used_tmp)
	
	room_ui.select_room(place, rooms[room_name_1], rooms[room_name_2], rooms[room_name_3], entry_direction)
	
func random_room(n: int, rUsed: Array):
	var m = 0
	for room_name in rooms_rnd:
		if room_name in rUsed:
			continue
		if m==n:
			return room_name
		m = m + 1
		
func rooms_used_total_weight():
	var weight = 0
	for room_name in rooms_used:
		weight = weight + rooms[room_name].rarity
	return weight

func spawn_room(place: Vector2, room: Room, entry_direction: Room.EntryDirection) -> void:
	rooms_used.append(room.room_name)
	room.spawn(place, entry_direction)
	blueprint_ui.draw_rooms(rooms.values())
	
	for door in get_tree().get_nodes_in_group("door"):
		door.on_room_spawn(rooms.values())

func save():
	var save_file = FileAccess.open(save_file_path, FileAccess.WRITE)
	save_data.days = days
	save_data.room_start_lock = room_start.lock_solved
	save_data.tarots = tarot_ui.tarots_found
	save_file.store_var(save_data.duplicate())
	save_file.close()
	
func load_save():
	if !FileAccess.file_exists(save_file_path):
		return
	var save_file = FileAccess.open(save_file_path, FileAccess.READ)
	var data = save_file.get_var()
	save_file.close()
	
	var save_d = data.duplicate()
	days = save_d.days
	tarot_ui.render(save_d.tarots)
	room_start.solve_lock(save_d.room_start_lock)
	
func start(load_save: bool):
	game_ui.visible = true
	player.capture_mouse()
	room_start.spawn(Vector2(0,2), Room.EntryDirection.DOWN)
	
	if !load_save:
		return
	load_save()
	
	
	
	
