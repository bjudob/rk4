extends CanvasLayer

@onready var game = get_tree().get_nodes_in_group("game")[0]

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
	play_button.texture =  load("res://assets/icons/winter_button_play_hover.png")
	hover_sound.play()

func _on_play_mouse_exited() -> void:
	play_button.texture =  load("res://assets/icons/winter_button_play.png")

func _on_continue_mouse_entered() -> void:
	continue_button.texture =  load("res://assets/icons/winter_button_load_hover.png")
	hover_sound.play()
	
func _on_continue_mouse_exited() -> void:
	continue_button.texture =  load("res://assets/icons/winter_button_load.png")

func _on_exit_mouse_entered() -> void:
	exit_button.texture =  load("res://assets/icons/winter_button_exit_hover.png")
	hover_sound.play()

func _on_exit_mouse_exited() -> void:
	exit_button.texture =  load("res://assets/icons/winter_button_exit.png")
