extends CanvasLayer

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var game = get_tree().get_nodes_in_group("game")[0]

func _ready() -> void:
	visible = false
	
func new_day(day: int):
	visible = true
	player.lock_move()
	player.release_mouse()

func _on_continue_pressed() -> void:
	game.new_day()
	player.unlock_move()
	player.capture_mouse()
	visible = false
