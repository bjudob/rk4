extends Node3D

@onready var play_button = $CanvasLayer/MarginContainer/VBoxContainer/Play
@onready var continue_button = $CanvasLayer/MarginContainer/VBoxContainer/Continue
@onready var exit_button = $CanvasLayer/MarginContainer/VBoxContainer/Exit
@onready var hover_sound = $HoverSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
