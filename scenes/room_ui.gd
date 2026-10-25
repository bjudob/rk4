extends CanvasLayer

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var game = get_tree().get_nodes_in_group("game")[0]

@onready var room_1_image = $MarginContainer/HBoxContainer/MarginContainer/Room1Image
@onready var room_2_image = $MarginContainer/HBoxContainer/MarginContainer2/Room2Image
@onready var room_3_image = $MarginContainer/HBoxContainer/Room3Image

var room_1: Room
var room_2: Room
var room_3: Room

func _ready() -> void:
	visible = false

func select_room(room1: Room, room2: Room, room3: Room):
	room_1 = room1
	room_2 = room2
	room_3 = room3
	room_1_image.texture = room1.image
	room_2_image.texture = room2.image
	room_3_image.texture = room3.image
	visible = true
	player.lock_move()
	

func spawn_room(room: Room) -> void:
	game.spawn_room(room)
	player.unlock_move()
	visible = false

func _on_room_1_image_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		spawn_room(room_1)


func _on_room_2_image_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		spawn_room(room_2)


func _on_room_3_image_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		spawn_room(room_3)
