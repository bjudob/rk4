extends Node3D

@onready var room = $Room
@onready var room_ui = $RoomUI

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func select_room(place: Vector2):
	room_ui.select_room(room, room, room)




func _on_area_3d_body_entered(body: Node3D) -> void:
	#if not body.is_in_group("player"):
		#return
	room.spawn(Vector2(0, 2))
