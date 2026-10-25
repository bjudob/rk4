extends CanvasLayer

@onready var player = get_tree().get_nodes_in_group("player")[0]

@onready var room_1_image = $MarginContainer/HBoxContainer/MarginContainer/Room1Image
@onready var room_2_image = $MarginContainer/HBoxContainer/MarginContainer2/Room2Image
@onready var room_3_image = $MarginContainer/HBoxContainer/Room3Image

func _ready() -> void:
	visible = false

func select_room(room1: Room, room2: Room, room3: Room):
	room_1_image.texture = room1.image
	room_2_image.texture = room2.image
	room_3_image.texture = room3.image
	visible = true
