extends Interactable

@export var same_level = true
@export var place = Vector2(-1, -1)

@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var collision = $CollisionShape3D


var room_selected = false

func interact():
	var place_to_place = place
	if same_level and player.position.x < position.x:
		place_to_place.y = place_to_place.y + 1
	if !same_level and player.position.z > position.z:
		place_to_place.x = place_to_place.x + 1
	
	if not room_selected:
		game.select_room(place_to_place)
		visible = false
		collision.disabled = true
		room_selected = true
	game.add_steps(-1)

func reset():
	room_selected = false
