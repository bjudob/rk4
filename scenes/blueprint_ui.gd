extends CanvasLayer

@onready var player = get_tree().get_nodes_in_group("player")[0]

func _ready() -> void:
	visible = false

func show_ui():
	visible = true
	player.lock_move()
	
func hide_ui():
	visible = false
	player.unlock_move()
