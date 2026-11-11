extends CanvasLayer

@onready var scroll_image = $MarginContainer/ScrollImage

var just_shown = false

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if !just_shown && Input.is_action_just_pressed("interact"):
		visible = false
	just_shown = false

func show_scroll(scroll: Texture):
	visible = true
	just_shown = true
	scroll_image.texture = scroll
