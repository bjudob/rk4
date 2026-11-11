class_name Interactable
extends StaticBody3D

@onready var game = get_tree().get_nodes_in_group("game")[0]
@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var scroll_ui = get_tree().get_nodes_in_group("scroll_ui")[0]

@onready var collision = $CollisionShape3D

const OUTLINE_MATERIAL = preload("res://materials/outline.tres")
@onready var model = $model
var mesh

func _ready():
	pass

func interact():
	pass
	
func reset():
	visible = true
	collision.disabled = false

func focus():
	mesh = get_first_mesh_child(model)
	mesh.material_overlay = OUTLINE_MATERIAL

func unfocus():
	if mesh == null:
		return
	mesh.material_overlay = null

func get_first_mesh_child(current_node: Node3D) -> MeshInstance3D:
	for child in current_node.get_children():
		if child is MeshInstance3D:
			return child
	return null
