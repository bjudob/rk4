extends CanvasLayer

@onready var game = get_tree().get_nodes_in_group("game")[0]

const NORMAL_COLOR = Color(1, 1, 1, 1)
const HOVER_COLOR = Color(0.4, 0.4, 0.4, 1)

@onready var play_button = $MarginContainer/VBoxContainer/Play
@onready var continue_button = $MarginContainer/VBoxContainer/Continue
@onready var exit_button = $MarginContainer/VBoxContainer/Exit
@onready var hover_sound = $HoverSound

func _on_play_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		visible = false
		game.start(false)

func _on_continue_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		visible = false
		game.start(true)

func _on_exit_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		get_tree().quit()

func _on_play_mouse_entered() -> void:
	play_button.modulate = HOVER_COLOR
	hover_sound.play()

func _on_play_mouse_exited() -> void:
	play_button.modulate = NORMAL_COLOR

func _on_continue_mouse_entered() -> void:
	continue_button.modulate = HOVER_COLOR
	hover_sound.play()
	
func _on_continue_mouse_exited() -> void:
	continue_button.modulate = NORMAL_COLOR

func _on_exit_mouse_entered() -> void:
	exit_button.modulate = HOVER_COLOR
	hover_sound.play()

func _on_exit_mouse_exited() -> void:
	exit_button.modulate = NORMAL_COLOR
