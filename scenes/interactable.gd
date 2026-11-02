class_name Interactable
extends StaticBody3D

const OUTLINE_MATERIAL = preload("res://materials/outline.tres")
@onready var model = $model
var mesh

func _ready():
	pass

func interact():
	pass
	
func reset():
	pass

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
