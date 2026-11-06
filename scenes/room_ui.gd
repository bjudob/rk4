extends CanvasLayer

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var hover_sound = $HoverSound

var room_place = Vector2(-1,-1)
@onready var room_1_image = $MarginContainer/HBoxContainer/MarginContainer/Room1Image
@onready var room_2_image = $MarginContainer/HBoxContainer/MarginContainer2/Room2Image
@onready var room_3_image = $MarginContainer/HBoxContainer/Room3Image

const NORMAL_COLOR = Color(1, 1, 1, 1)
const HOVER_COLOR = Color(0.4, 0.4, 0.4, 1)

var room_1: Room
var room_2: Room
var room_3: Room

func _ready() -> void:
	visible = false

func select_room(place: Vector2, room1: Room, room2: Room, room3: Room):
	room_place = place
	room_1 = room1
	room_2 = room2
	room_3 = room3
	room_1_image.texture = room1.image
	room_2_image.texture = room2.image
	room_3_image.texture = room3.image
	visible = true
	player.lock_move()
	

func spawn_room(room: Room) -> void:
	game.spawn_room(room_place, room)
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
		

func _on_room_1_image_mouse_entered() -> void:
	hover_sound.play()
	room_1_image.modulate = HOVER_COLOR


func _on_room_1_image_mouse_exited() -> void:
	room_1_image.modulate = NORMAL_COLOR


func _on_room_2_image_mouse_entered() -> void:
	hover_sound.play()
	room_2_image.modulate = HOVER_COLOR


func _on_room_2_image_mouse_exited() -> void:
	room_2_image.modulate = NORMAL_COLOR


func _on_room_3_image_mouse_entered() -> void:
	hover_sound.play()
	room_3_image.modulate = HOVER_COLOR


func _on_room_3_image_mouse_exited() -> void:
	room_3_image.modulate = NORMAL_COLOR
