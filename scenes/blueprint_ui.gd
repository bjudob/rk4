extends CanvasLayer

@onready var player = get_tree().get_nodes_in_group("player")[0]

@onready var blueprints = [
	[
		$RoomLayout/VBoxContainer/Row5/Room1,
		$RoomLayout/VBoxContainer/Row5/Room2,
		$RoomLayout/VBoxContainer/Row5/Room3,
		$RoomLayout/VBoxContainer/Row5/Room4,
		$RoomLayout/VBoxContainer/Row5/Room5,
	],
			[
		$RoomLayout/VBoxContainer/Row4/Room1,
		$RoomLayout/VBoxContainer/Row4/Room2,
		$RoomLayout/VBoxContainer/Row4/Room3,
		$RoomLayout/VBoxContainer/Row4/Room4,
		$RoomLayout/VBoxContainer/Row4/Room5,
	],
			[
		$RoomLayout/VBoxContainer/Row3/Room1,
		$RoomLayout/VBoxContainer/Row3/Room2,
		$RoomLayout/VBoxContainer/Row3/Room3,
		$RoomLayout/VBoxContainer/Row3/Room4,
		$RoomLayout/VBoxContainer/Row3/Room5,
	],
			[
		$RoomLayout/VBoxContainer/Row2/Room1,
		$RoomLayout/VBoxContainer/Row2/Room2,
		$RoomLayout/VBoxContainer/Row2/Room3,
		$RoomLayout/VBoxContainer/Row2/Room4,
		$RoomLayout/VBoxContainer/Row2/Room5,
	],
	[
		$RoomLayout/VBoxContainer/Row1/Room1,
		$RoomLayout/VBoxContainer/Row1/Room2,
		$RoomLayout/VBoxContainer/Row1/Room3,
		$RoomLayout/VBoxContainer/Row1/Room4,
		$RoomLayout/VBoxContainer/Row1/Room5,
	]
]

func _ready() -> void:
	visible = false

func draw_rooms(rooms):
	for room in rooms:
		#if !room.spawned():
			#return
		blueprints[room.place.x][room.place.y].texture = room.image

func show_ui():
	visible = true
	
func hide_ui():
	visible = false
