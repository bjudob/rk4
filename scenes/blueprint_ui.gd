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

@onready var paintings = [
	[
		[
			load("res://assets/painting/1_1_lap.png"),
			load("res://assets/painting/1_1_alap.png")
		],
		[
			load("res://assets/painting/1_2_szal.png"),
			load("res://assets/painting/1_2_szall.png")
		],
		[
			load("res://assets/painting/1_3_pok.png"),
			load("res://assets/painting/1_3_apok.png")
		],
		[
			load("res://assets/painting/1_4_olet.png"),
			load("res://assets/painting/1_4_otlet.png")
		],
		[
			load("res://assets/painting/1_5_tor.png"),
			load("res://assets/painting/1_5_tort.png")
		]
	],
	[
		[
			load("res://assets/painting/2_1_fuggo.png"),
			load("res://assets/painting/2_1_fuggony.png")
		],
		[
			load("res://assets/painting/2_2_csorog.png"),
			load("res://assets/painting/2_2_acsorog.png")
		],
		[
			load("res://assets/painting/2_3_ad.png"),
			load("res://assets/painting/2_3_vad.png")
		],
		[
			load("res://assets/painting/2_4_rom.png"),
			load("res://assets/painting/2_4_orom.png")
		],
		[
			load("res://assets/painting/2_5_eres.png"),
			load("res://assets/painting/2_5_egres.png")
		]
	],
	[
		[
			load("res://assets/painting/3_1_ram.png"),
			load("res://assets/painting/3_1_uram.png")
		],
		[
			load("res://assets/painting/3_2_at.png"),
			load("res://assets/painting/3_2_gat.png")
		],
		[
			load("res://assets/painting/3_3_boa.png"),
			load("res://assets/painting/3_3_oboa.png")
		],
		[
			load("res://assets/painting/3_4_acs.png"),
			load("res://assets/painting/3_4_racs.png")
		],
		[
			load("res://assets/painting/3_5_eg.png"),
			load("res://assets/painting/3_5_jeg.png")
		]
	],
		[
		[
			load("res://assets/painting/4_1_ar.png"),
			load("res://assets/painting/4_1_var.png")
		],
		[
			load("res://assets/painting/4_2_tel.png"),
			load("res://assets/painting/4_2_etel.png")
		],
		[
			load("res://assets/painting/4_3_arat.png"),
			load("res://assets/painting/4_3_garat.png")
		],
		[
			load("res://assets/painting/4_4_eles.png"),
			load("res://assets/painting/4_4_les.png")
		],
		[
			load("res://assets/painting/4_5_apos.png"),
			load("res://assets/painting/4_5_napos.png")
		]
	],
		[
		[
			load("res://assets/painting/5_1_agyon.png"),
			load("res://assets/painting/5_1_vagyon.png")
		],
		[
			load("res://assets/painting/5_2_mak.png"),
			load("res://assets/painting/5_2_imak.png")
		],
		[
			load("res://assets/painting/5_3_ulo.png"),
			load("res://assets/painting/5_3_ullo.png")
		],
		[
			load("res://assets/painting/5_4_lom.png"),
			load("res://assets/painting/5_4_alom.png")
		],
		[
			load("res://assets/painting/5_5_ian.png"),
			load("res://assets/painting/5_5_yang.png")
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
			
		room.set_paintings(paintings[room.place.x][room.place.y][0], paintings[room.place.x][room.place.y][1])
		
		# Get a copy of the image data so we don't mutate the original room.image resource
		var img: Image = room.image.get_image()

		if img.is_compressed():
			var err = img.decompress()
			if err != OK:
				push_error("Failed to decompress room image")
				continue
		
		match room.entry_direction:
			Room.EntryDirection.DOWN:
				pass
			Room.EntryDirection.UP:
				img.rotate_180()
			Room.EntryDirection.LEFT:
				img.rotate_90(CLOCKWISE)
			Room.EntryDirection.RIGHT:
				img.rotate_90(COUNTERCLOCKWISE)
				
		blueprints[room.place.x][room.place.y].texture = ImageTexture.create_from_image(img)

func reset():
	for i in len(blueprints):
		for j in len(blueprints[i]):
			# start room
			if i == 0  and j == 2:
				continue
			blueprints[i][j].texture = room_none

func show_ui():
	visible = true
	
func hide_ui():
	visible = false
