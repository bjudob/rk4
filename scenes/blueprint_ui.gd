extends CanvasLayer

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var reki = $Reki
var room_none = load("res://assets/room_icons/room_none.png")

const mid_reki_pos = Vector2(1285, 800)
const scale_factor = 22.7

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

@onready var pictures = [
	[
		[
			"res://assets/painting/4_1_ar.png",
			"res://assets/painting/4_1_var.png"
		],
		[
			"res://assets/painting/4_2_etel.png",
			"res://assets/painting/4_2_tel.png"
		],
		[
			"res://assets/painting/4_3_arat.png",
			"res://assets/painting/4_3_garat.png"
		],
		[
			"res://assets/painting/3_4_acs.png",
			"res://assets/painting/3_4_racs.png"
		],
		[
			"res://assets/painting/3_5_eg.png",
			"res://assets/painting/3_5_jeg.png"
		]
	],
	[
		[
			"res://assets/painting/5_1_agyon.png",
			"res://assets/painting/5_1_vagyon.png"
		],
		[
			"res://assets/painting/5_2_imak.png",
			"res://assets/painting/5_2_mak.png"
		],
		[
			"res://assets/painting/5_3_ullo.png",
			"res://assets/painting/5_3_ulo.png"
		],
		[
			"res://assets/painting/5_4_alom.png",
			"res://assets/painting/5_4_lom.png"
		],
		[
			"res://assets/painting/5_5_ian.png",
			"res://assets/painting/5_5_yang.png"
		]
	],
	[
		[
			"res://assets/painting/4_1_ar.png",
			"res://assets/painting/4_1_var.png"
		],
		[
			"res://assets/painting/3_2_at.png",
			"res://assets/painting/3_2_gat.png"
		],
		[
			"res://assets/painting/3_3_boa.png",
			"res://assets/painting/3_3_oboa.png"
		],
		[
			"res://assets/painting/3_4_acs.png",
			"res://assets/painting/3_4_racs.png"
		],
		[
			"res://assets/painting/3_5_eg.png",
			"res://assets/painting/3_5_jeg.png"
		]
	]
]

func _ready() -> void:
	visible = false

func _process(delta: float):
	reki.position = mid_reki_pos + scale_factor * Vector2(player.global_position.x, player.global_position.z)

func draw_rooms(rooms):
	reset()
	for room in rooms:
		if !room.spawned():
			continue
		blueprints[room.place.x][room.place.y].texture = room.image

func reset():
	for i in len(blueprints):
		for j in len(blueprints[i]):
			blueprints[i][j].texture = room_none

func show_ui():
	visible = true
	
func hide_ui():
	visible = false
