class_name Room
extends Node3D

@export var room_name: String = "noname"
@export var wall_type: Walls.Type = Walls.Type.ALL
@export var image: Texture2D = load("res://assets/room_icons/tree.png")
@export var rarity: int = 99
@export var candy_cost = 0

@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var room_00 = get_tree().get_nodes_in_group("room_00_pos")[0]
@onready var lock = $Lock

@onready var painting1 = $Painting1
@onready var painting2 = $Painting2

enum EntryDirection {
	LEFT,
	RIGHT,
	DOWN,
	UP
}

const WALLS_SCENE = preload("res://scenes/walls.tscn")
var walls

var place = Vector2(-1,-1)
var room_0_place = Vector3(-1,-1,-1)
var lock_solved = false


func _ready() -> void:
	position.y = -100
	room_0_place = room_00.global_position
	
	# add walls
	walls = WALLS_SCENE.instantiate()
	add_child(walls)
	walls.set_type(wall_type)

func spawn(spawn_place: Vector2, direction: EntryDirection) -> void:
	visible = true
	place = spawn_place
	# hanyadik sor
	global_position.z = room_0_place.z - 11 * place.x
	# hanyadik a sorban
	global_position.x = room_0_place.x + 11 * place.y
	global_position.y = 0
	# honnan nyitjuk ki
	if direction == EntryDirection.DOWN:
		pass
	elif direction == EntryDirection.UP:
		rotation_degrees.y = 180
	elif direction == EntryDirection.LEFT:
		rotation_degrees.y = -90
	elif direction == EntryDirection.RIGHT:
		rotation_degrees.y = 90
	

func spawned() -> bool:
	return place.x!=-1 and place.y!=-1
	
func reset():
	rotation_degrees.y = 0
	visible = false
	position.y = -100
	place = Vector2(-1,-1)
	for c in get_children():
		if !is_instance_of(c, Interactable):
			continue
		c.reset()

func set_paintings(t1: Texture, t2: Texture):
	painting1.texture = t1
	painting2.texture = t2
		
func solve_lock(solved: bool):
	if !solved:
		return
	lock_solved = true
	lock.solve()
