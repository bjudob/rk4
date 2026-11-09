class_name Door
extends Interactable

@export var same_level = true
@export var place = Vector2(-1, -1)
var entryDirection
var place_to_place

@onready var key_ui = get_tree().get_nodes_in_group("key_ui")[0]

var key_needed = true
var room_selected = false

func interact():
	place_to_place = place
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
	
	if not key_needed:
		select_room()
	else:
		key_ui.show_ui(self)
		

func select_room():
	game.select_room(place_to_place, entryDirection)
	visible = false
	collision.disabled = true
	room_selected = true

func on_room_spawn(rooms):
	var room_needed_1 = place
	var room_needed_2 = Vector2(0,0)
	if same_level:
		room_needed_2 = Vector2(place.x,place.y+1)
	else:
		room_needed_2 = Vector2(place.x+1,place.y)
		
	var room_1_found = false
	var room_2_found = false
	for room in rooms:
		if room.place == room_needed_1:
			room_1_found = true
		if room.place == room_needed_2:
			room_2_found = true
	if room_1_found and room_2_found:
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
