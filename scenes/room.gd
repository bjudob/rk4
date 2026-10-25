class_name Room
extends Node3D

@export var room_name: String = "noname"
@export var image: Texture2D = load("res://assets/room_icons/tree.png")

@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var room_00 = get_tree().get_nodes_in_group("room_00_pos")[0]

var place = Vector2(-1,-1)
var room_0_place = Vector3(-1,-1,-1)


func _ready() -> void:
	position.y = -100
	room_0_place = room_00.global_position


func _process(delta: float) -> void:
	pass

func spawn(place: Vector2) -> void:
	self.place = place
	# hanyadik sor
	global_position.z = room_0_place.z - 11 * place.x
	# hanyadik a sorban
	global_position.x = room_0_place.x + 11 * place.y
	global_position.y = 0
	

func spawned() -> bool:
	return place.x!=-1 and place.y!=-1
