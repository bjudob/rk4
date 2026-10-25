extends CanvasLayer

@onready var room_1_image = $MarginContainer/HBoxContainer/MarginContainer/Room1Image
@onready var room_2_image = $MarginContainer/HBoxContainer/MarginContainer2/Room2Image
@onready var room_3_image = $MarginContainer/HBoxContainer/Room3Image

func _ready() -> void:
	visible = false

func select_room(room1: Room, room2: Room, room3: Room):
	visible = true
