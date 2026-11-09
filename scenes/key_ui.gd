extends CanvasLayer

@onready var player = get_tree().get_nodes_in_group("player")[0]

@onready var open_button = $MarginContainer/VBoxContainer/HBoxContainer/Open
@onready var close_button = $MarginContainer/VBoxContainer/HBoxContainer/Close
@onready var hover_sound = $HoverSound

const NORMAL_COLOR = Color(1, 1, 1, 1)
const HOVER_COLOR = Color(0.4, 0.4, 0.4, 1)

var door

func _ready() -> void:
	visible = false

func show_ui(d: Door):
	door = d
	visible = true
	player.lock_move()
	player.release_mouse()

func _on_open_mouse_entered() -> void:
	open_button.modulate = HOVER_COLOR
	hover_sound.play()

func _on_open_mouse_exited() -> void:
	open_button.modulate = NORMAL_COLOR
	
func _on_open_gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		get_viewport().set_input_as_handled()
		door.select_room()
		player.unlock_move()
		player.capture_mouse()
		visible = false

func _on_close_mouse_entered() -> void:
	close_button.modulate = HOVER_COLOR
	hover_sound.play()

func _on_close_mouse_exited() -> void:
	close_button.modulate = NORMAL_COLOR

func _on_close_gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		get_viewport().set_input_as_handled()
		player.unlock_move()
		player.capture_mouse()
		visible = false
