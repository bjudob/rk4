extends Interactable

@export var same_level = true
@export var place = Vector2(-1, -1)

@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var collision = $CollisionShape3D


var room_selected = false

func interact():
	var entryDirection = Room.EntryDirection.DOWN
	var place_to_place = place
	if same_level:
		if  player.position.x < position.x:
			entryDirection = Room.EntryDirection.LEFT
			place_to_place.y = place_to_place.y + 1
		else:
			entryDirection = Room.EntryDirection.RIGHT
	if !same_level:
		if player.position.z > position.z:
			entryDirection = Room.EntryDirection.DOWN
			place_to_place.x = place_to_place.x + 1
		else:
			entryDirection = Room.EntryDirection.UP
	
	if not room_selected:
		game.select_room(place_to_place, entryDirection)
		visible = false
		collision.disabled = true
		room_selected = true

func reset():
	visible = true
	collision.disabled = false
	room_selected = false


func _on_step_area_body_entered(body: Node3D) -> void:
	if !body.is_in_group("player"):
		return
	game.add_steps(-1)
