class_name Room
extends Node3D

@export var image: Texture2D = load("res://assets/room_icons/tree.png")

@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var room_00 = get_tree().get_nodes_in_group("room_00_pos")[0]

var place = Vector2(-1,-1)
var room_0_place = Vector3(-1,-1,-1)



func _ready() -> void:
	position.y = -100
	room_0_place = room_00.position


func _process(delta: float) -> void:
	pass

func spawn(place: Vector2) -> void:
	self.place = place
	position.y = 0
	

func spawned() -> bool:
	return place.x!=-1 and place.y!=-1
