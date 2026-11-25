extends Interactable

@export var paper_piece = -1
@export var scroll = load("res://assets/scrolls/scroll_hexa_6.png")

@onready var reverse_room = get_tree().get_nodes_in_group("reverse_room")[0]

func interact():
	scroll_ui.show_scroll(scroll)
	reverse_room.add_paper_piece(paper_piece)

func enable():
	visible = true
	$CollisionShape3D.disabled = false
	
func disable():
	visible = false
	$CollisionShape3D.disabled = true
